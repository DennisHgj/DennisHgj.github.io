#!/usr/bin/env python

import os
import re
import sys
import yaml
from datetime import datetime
from urllib.error import HTTPError, URLError
from urllib.parse import urlencode
from urllib.request import Request, urlopen


def load_scholar_user_id() -> str:
    """Load the Google Scholar user ID from the configuration file."""
    config_file = "_data/socials.yml"
    if not os.path.exists(config_file):
        print(
            f"Configuration file {config_file} not found. Please ensure the file exists and contains your Google Scholar user ID."
        )
        sys.exit(1)
    try:
        with open(config_file, "r") as f:
            config = yaml.safe_load(f)
        scholar_user_id = config.get("scholar_userid")
        if not scholar_user_id:
            print(
                "No 'scholar_userid' found in the configuration file. Please add 'scholar_userid' to _data/socials.yml."
            )
            sys.exit(1)
        return scholar_user_id
    except yaml.YAMLError as e:
        print(
            f"Error parsing YAML file {config_file}: {e}. Please check the file for correct YAML syntax."
        )
        sys.exit(1)


SCHOLAR_USER_ID: str = load_scholar_user_id()
OUTPUT_FILE: str = "_data/citations.yml"


def fetch_public_profile_metrics() -> dict:
    """Fetch the summary table from the public Google Scholar profile."""
    query = urlencode({"user": SCHOLAR_USER_ID, "hl": "en"})
    request = Request(
        f"https://scholar.google.com/citations?{query}",
        headers={
            "Accept": "text/html,application/xhtml+xml",
            "Accept-Language": "en-US,en;q=0.9",
            "User-Agent": (
                "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 "
                "(KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
            ),
        },
    )

    try:
        with urlopen(request, timeout=25) as response:
            profile_html = response.read().decode("utf-8", errors="replace")
    except (HTTPError, URLError, TimeoutError) as error:
        raise RuntimeError(f"Google Scholar profile request failed: {error}") from error

    if "gsc_rsb_std" not in profile_html:
        raise RuntimeError("Google Scholar returned a verification or incomplete page.")

    metric_values = [
        int(value.replace(",", ""))
        for value in re.findall(r'class="gsc_rsb_std">\s*([\d,]+)\s*<', profile_html)
    ]
    if len(metric_values) < 5:
        raise RuntimeError("Google Scholar profile metrics could not be parsed.")

    return {
        "total_citations": metric_values[0],
        "h_index": metric_values[2],
        "i10_index": metric_values[4],
    }


def get_scholar_citations() -> None:
    """Fetch and update Google Scholar citation data."""
    print(f"Fetching citations for Google Scholar ID: {SCHOLAR_USER_ID}")
    today = datetime.now().strftime("%Y-%m-%d")
    existing_data = {}

    # Check if the output file was already updated today
    if os.path.exists(OUTPUT_FILE):
        try:
            with open(OUTPUT_FILE, "r") as f:
                existing_data = yaml.safe_load(f)
            if (
                existing_data
                and "metadata" in existing_data
                and "last_updated" in existing_data["metadata"]
            ):
                print(f"Last updated on: {existing_data['metadata']['last_updated']}")
                if str(existing_data["metadata"]["last_updated"]) == today:
                    print("Citations data is already up-to-date. Skipping fetch.")
                    return
        except Exception as e:
            print(
                f"Warning: Could not read existing citation data from {OUTPUT_FILE}: {e}. The file may be missing or corrupted."
            )

    try:
        profile_metrics = fetch_public_profile_metrics()
    except Exception as e:
        print(
            f"Error fetching author data from Google Scholar for user ID '{SCHOLAR_USER_ID}': {e}. Please check your internet connection and Scholar user ID."
        )
        sys.exit(1)

    citation_data = {
        "metadata": {
            "last_updated": today,
            "scholar_userid": SCHOLAR_USER_ID,
            **profile_metrics,
        },
        "papers": existing_data.get("papers", {}) if existing_data else {},
    }

    print(
        "Profile metrics: "
        f"citations={profile_metrics['total_citations']}, "
        f"h-index={profile_metrics['h_index']}, "
        f"i10-index={profile_metrics['i10_index']}"
    )

    # Compare new data with existing data
    existing_metadata = existing_data.get("metadata", {}) if existing_data else {}
    profile_metrics_unchanged = all(
        existing_metadata.get(key) == citation_data["metadata"].get(key)
        for key in ("scholar_userid", "total_citations", "h_index", "i10_index")
    )
    if (
        existing_data
        and profile_metrics_unchanged
        and existing_data.get("papers") == citation_data["papers"]
    ):
        print("No changes in citation data. Skipping file update.")
        return

    try:
        with open(OUTPUT_FILE, "w") as f:
            yaml.dump(citation_data, f, width=1000, sort_keys=True)
        print(f"Citation data saved to {OUTPUT_FILE}")
    except Exception as e:
        print(
            f"Error writing citation data to {OUTPUT_FILE}: {e}. Please check file permissions and disk space."
        )
        sys.exit(1)


if __name__ == "__main__":
    try:
        get_scholar_citations()
    except Exception as e:
        print(f"Unexpected error: {e}")
        sys.exit(1)
