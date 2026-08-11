# frozen_string_literal: true

CV_DATE_ALIGNMENT_STYLE = <<~HTML.freeze
  <style id="cv-date-alignment">
    @media (min-width: 768px) {
      .cv .date-column {
        text-align: left !important;
      }
    }
  </style>
HTML

Jekyll::Hooks.register :pages, :post_render do |page|
  next unless page.data['layout'] == 'cv'
  next if page.output.include?('id="cv-date-alignment"')

  page.output = page.output.sub('</head>', "#{CV_DATE_ALIGNMENT_STYLE}</head>")
end
