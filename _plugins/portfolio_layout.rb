# frozen_string_literal: true

PORTFOLIO_LAYOUT_STYLE = <<~HTML.freeze
  <style id="portfolio-layout-style">
    .projects .portfolio-project-grid {
      display: flex;
      flex-wrap: wrap;
      margin-left: -0.75rem;
      margin-right: -0.75rem;
    }

    .projects .portfolio-project-column {
      display: flex;
      flex: 0 0 50% !important;
      max-width: 50% !important;
      padding-left: 0.75rem;
      padding-right: 0.75rem;
      width: 50% !important;
    }

    .projects .portfolio-project-card {
      display: flex;
      flex-direction: column;
      min-height: 25rem;
      overflow: hidden;
      width: 100%;
    }

    .projects .project-card-main {
      color: inherit;
      display: flex;
      flex: 1 1 auto;
      flex-direction: column;
      text-decoration: none;
      width: 100%;
    }

    .projects .project-card-main:hover {
      color: inherit;
      text-decoration: none;
    }

    .projects .project-card-image-shell {
      align-items: center;
      background: rgba(127, 127, 127, 0.04);
      display: flex;
      flex: 0 0 12rem;
      height: 12rem;
      justify-content: center;
      overflow: hidden;
      width: 100%;
    }

    .projects .project-card-image {
      display: block;
      height: 100%;
      object-fit: contain;
      object-position: center;
      padding: 0.85rem 1rem;
      width: 100%;
    }

    .projects .portfolio-project-card .card-body {
      display: flex;
      flex: 1 1 auto;
      flex-direction: column;
      padding: 1.15rem 1.25rem 0.75rem;
      width: 100%;
    }

    .projects .portfolio-project-card .card-title {
      font-size: 1.35rem;
      line-height: 1.3;
      margin: 0 0 0.65rem;
      min-height: 3.5rem;
    }

    .projects .portfolio-project-card .card-text {
      font-size: 0.96rem;
      line-height: 1.55;
      margin: 0;
      min-height: 6rem;
    }

    .projects .project-card-footer {
      align-items: center;
      display: flex;
      min-height: 3rem;
      padding: 0 1.25rem 1rem;
    }

    .projects .project-card-action {
      align-items: center;
      color: var(--global-theme-color);
      display: inline-flex;
      font-weight: 500;
      gap: 0.4rem;
      text-decoration: none;
    }

    .projects .project-card-action:hover {
      color: var(--global-hover-color);
      text-decoration: none;
    }

    .repository-grid {
      align-items: start !important;
      display: grid !important;
      gap: 1rem;
      grid-template-columns: repeat(2, minmax(0, 1fr));
    }

    .repository-grid .repo {
      max-width: 100% !important;
      padding: 0 !important;
      width: 100% !important;
    }

    .repository-grid .repo > a {
      display: block;
      width: 100%;
    }

    .repository-grid .repo img {
      height: auto;
      max-width: 100%;
      width: 100% !important;
    }

    @media (max-width: 767.98px) {
      .projects .portfolio-project-column {
        flex-basis: 100% !important;
        max-width: 100% !important;
        width: 100% !important;
      }

      .projects .portfolio-project-card {
        min-height: 0;
      }

      .projects .project-card-image-shell {
        flex-basis: 11rem;
        height: 11rem;
      }

      .projects .portfolio-project-card .card-title,
      .projects .portfolio-project-card .card-text {
        min-height: 0;
      }

      .repository-grid {
        grid-template-columns: minmax(0, 1fr);
      }
    }
  </style>
HTML

Jekyll::Hooks.register :pages, :post_render do |page|
  next unless page.output_ext == '.html'
  next unless page.output.include?('<div class="projects">') || page.output.include?('repository-grid')
  next if page.output.include?('id="portfolio-layout-style"')

  page.output.sub!('</head>', "#{PORTFOLIO_LAYOUT_STYLE}</head>")
end
