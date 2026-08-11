# frozen_string_literal: true

PORTFOLIO_LAYOUT_STYLE = <<~HTML.freeze
  <style id="portfolio-layout-style">
    .projects .row.row-cols-1 > .col {
      display: flex;
      flex: 0 0 50%;
      max-width: 50%;
      width: 50%;
    }

    .projects .row.row-cols-1 > .col > a {
      color: inherit;
      display: flex;
      text-decoration: none;
      width: 100%;
    }

    .projects .card {
      min-height: 25rem;
      overflow: hidden;
      width: 100%;
    }

    .projects .card > .row.no-gutters {
      display: flex !important;
      flex-direction: column;
      flex-wrap: nowrap;
      height: 100%;
      margin: 0 !important;
    }

    .projects .card > .row.no-gutters > .col-md-6:first-child {
      background: rgba(127, 127, 127, 0.04);
      flex: 0 0 11.5rem !important;
      height: 11.5rem;
      max-width: 100% !important;
      width: 100%;
    }

    .projects .card figure,
    .projects .card picture {
      display: block;
      height: 100%;
      margin: 0;
      width: 100%;
    }

    .projects .card img.card-img {
      background: transparent;
      border-radius: 0;
      height: 100% !important;
      object-fit: contain;
      object-position: center;
      padding: 0.85rem 1rem;
      width: 100%;
    }

    .projects .card > .row.no-gutters > .col-md-6:last-child {
      display: flex;
      flex: 1 1 auto !important;
      max-width: 100% !important;
      width: 100%;
    }

    .projects .card-body {
      display: flex;
      flex-direction: column;
      padding: 1.15rem 1.25rem 1.1rem;
      width: 100%;
    }

    .projects .card-title {
      font-size: 1.35rem;
      line-height: 1.3;
      margin: 0 0 0.65rem;
      min-height: 3.5rem;
    }

    .projects .card-text {
      font-size: 0.96rem;
      line-height: 1.55;
      margin-bottom: 1rem;
      min-height: 6rem;
    }

    .projects .card-body > .row {
      margin-top: auto !important;
    }

    .repository-grid {
      align-items: start !important;
      display: grid !important;
      gap: 0.5rem;
      grid-template-columns: repeat(2, minmax(0, 1fr));
    }

    .repository-grid .repo {
      padding: 0.35rem !important;
      width: 100%;
    }

    .repository-grid .repo img {
      display: block;
    }

    @media (max-width: 767.98px) {
      .projects .row.row-cols-1 > .col {
        flex-basis: 100%;
        max-width: 100%;
        width: 100%;
      }

      .projects .card {
        min-height: 0;
      }

      .projects .card > .row.no-gutters > .col-md-6:first-child {
        flex-basis: 10.5rem !important;
        height: 10.5rem;
      }

      .projects .card-title,
      .projects .card-text {
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
