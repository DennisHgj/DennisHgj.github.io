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
  next if page.output.include?('id="profile-layout-style"')

  page.output.sub!('</head>', "#{PROFILE_LAYOUT_STYLE}</head>")
end
