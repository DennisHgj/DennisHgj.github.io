# frozen_string_literal: true

PROFILE_LAYOUT_STYLE = <<~HTML.freeze
  <style id="profile-layout-style">
    .profile .more-info {
      font-family: inherit;
      font-size: 0.9rem;
      letter-spacing: 0;
      line-height: 1.45;
      margin-bottom: 0.75rem;
      margin-top: 0.8rem;
      text-align: left;
    }

    .profile .more-info p {
      display: block;
      margin: 0 0 0.3rem;
      overflow-wrap: anywhere;
      word-break: normal;
    }

    .profile .more-info a {
      font-family: inherit;
      font-size: 0.86rem;
      letter-spacing: 0;
    }

    .opportunity-banner {
      align-items: center;
      background: color-mix(in srgb, var(--global-theme-color) 9%, var(--global-bg-color));
      border: 1px solid color-mix(in srgb, var(--global-theme-color) 35%, transparent);
      border-left: 4px solid var(--global-theme-color);
      border-radius: 0.55rem;
      display: flex;
      gap: 0.75rem;
      margin: 0 0 1.2rem;
      padding: 0.8rem 1rem;
    }

    .opportunity-banner > i {
      color: var(--global-theme-color);
      flex: 0 0 auto;
      font-size: 1.15rem;
    }

    .opportunity-banner strong,
    .opportunity-banner span {
      display: block;
    }

    .opportunity-banner strong {
      color: var(--global-text-color);
      font-size: 1rem;
      line-height: 1.35;
    }

    .opportunity-banner span {
      color: var(--global-text-color-light);
      font-size: 0.88rem;
      line-height: 1.4;
      margin-top: 0.12rem;
    }

    .homepage-stats {
      align-items: center;
      border-top: 1px solid var(--global-divider-color);
      color: var(--global-text-color-light);
      display: flex;
      flex-wrap: wrap;
      font-size: 0.76rem;
      gap: 0.6rem 1.1rem;
      justify-content: center;
      margin: 2.25rem 0 0;
      padding: 0.8rem 0 0;
    }

    .homepage-stat-item {
      align-items: center;
      color: var(--global-text-color-light);
      display: flex;
      gap: 0.35rem;
      line-height: 1;
      text-decoration: none;
    }

    a.homepage-stat-item:hover {
      color: var(--global-theme-color);
      text-decoration: none;
    }

    .homepage-stat-item > i {
      flex: 0 0 auto;
      font-size: 0.8rem;
      opacity: 0.75;
      text-align: center;
    }

    .homepage-stat-badge {
      display: block;
      height: 18px;
      max-width: 100%;
      width: auto;
    }

    .homepage-stat-item strong {
      color: inherit;
      font-weight: 600;
    }

    @media (max-width: 575.98px) {
      .profile .more-info {
        text-align: center;
      }

      .opportunity-banner {
        align-items: flex-start;
      }

    }
  </style>
HTML

Jekyll::Hooks.register :pages, :post_render do |page|
  next unless page.output_ext == '.html'
  next unless page.output.include?('<div class="more-info">')

  stats_pattern = /\s*<div class="homepage-stats"[^>]*>.*?<\/div>/m
  if (stats = page.output.match(stats_pattern))
    page.output.sub!(stats_pattern, '')
    page.output.sub!('</article>', "\n#{stats[0].strip}\n</article>")
  end

  next if page.output.include?('id="profile-layout-style"')

  page.output.sub!('</head>', "#{PROFILE_LAYOUT_STYLE}</head>")
end
