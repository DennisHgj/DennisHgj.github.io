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
      display: grid;
      gap: 0.8rem;
      grid-template-columns: repeat(2, minmax(0, 1fr));
      margin: -0.25rem 0 1.35rem;
    }

    .homepage-stat-card {
      align-items: center;
      background: var(--global-card-bg-color);
      border: 1px solid var(--global-divider-color);
      border-radius: 0.55rem;
      color: var(--global-text-color);
      display: flex;
      gap: 0.75rem;
      min-height: 5.75rem;
      padding: 0.85rem 0.95rem;
      position: relative;
      text-decoration: none;
    }

    a.homepage-stat-card:hover {
      border-color: var(--global-theme-color);
      color: var(--global-text-color);
      text-decoration: none;
      transform: translateY(-1px);
    }

    .homepage-stat-card > i:first-child {
      color: var(--global-theme-color);
      flex: 0 0 auto;
      font-size: 1.35rem;
      text-align: center;
      width: 1.5rem;
    }

    .homepage-stat-content {
      display: flex;
      flex: 1 1 auto;
      flex-direction: column;
      min-width: 0;
    }

    .homepage-stat-label {
      color: var(--global-text-color);
      font-size: 0.88rem;
      font-weight: 600;
      line-height: 1.3;
      margin-bottom: 0.28rem;
    }

    .homepage-stat-badge {
      align-self: flex-start;
      display: block;
      height: 24px;
      max-width: 100%;
      width: auto;
    }

    .homepage-stat-value {
      color: var(--global-theme-color);
      font-size: 1.45rem;
      line-height: 1.05;
    }

    .homepage-stat-card small {
      color: var(--global-text-color-light);
      font-size: 0.72rem;
      line-height: 1.35;
      margin-top: 0.3rem;
    }

    .homepage-stat-link-icon {
      color: var(--global-text-color-light);
      font-size: 0.65rem;
      position: absolute;
      right: 0.65rem;
      top: 0.6rem;
    }

    @media (max-width: 575.98px) {
      .profile .more-info {
        text-align: center;
      }

      .opportunity-banner {
        align-items: flex-start;
      }

      .homepage-stats {
        grid-template-columns: 1fr;
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
