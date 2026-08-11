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

    @media (max-width: 575.98px) {
      .profile .more-info {
        text-align: center;
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
