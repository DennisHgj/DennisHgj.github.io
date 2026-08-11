# frozen_string_literal: true

require 'cgi'

PUBLICATION_KEYWORD_STYLE = <<~HTML.freeze
  <style id="publication-keyword-style">
    .pub-keywords {
      display: flex;
      flex-wrap: wrap;
      gap: 0.35rem;
      margin: 0.45rem 0 0.15rem;
    }

    .pub-keyword {
      border: 1px solid var(--global-theme-color);
      border-radius: 999px;
      color: var(--global-theme-color);
      font-size: 0.78rem;
      font-weight: 500;
      line-height: 1.35;
      padding: 0.12rem 0.55rem;
    }
  </style>
HTML

module PublicationKeywords
  module_function

  def render(keywords, language)
    label = language == 'zh' ? '论文关键词' : 'Publication keywords'
    tags = keywords.map { |keyword| %(<span class="pub-keyword">#{CGI.escapeHTML(keyword)}</span>) }.join
    %(<div class="pub-keywords" aria-label="#{label}">#{tags}</div>)
  end

  def inject(output, data, language)
    inserted = false

    data.each do |bibkey, translations|
      keywords = translations[language]
      next if keywords.nil? || keywords.empty?

      pattern = %r{(<div id="#{Regexp.escape(bibkey)}" class="col-sm-8">.*?)(<div class="links">)}m
      next unless output.match?(pattern)

      output.sub!(pattern) do
        inserted = true
        "#{Regexp.last_match(1)}#{render(keywords, language)}#{Regexp.last_match(2)}"
      end
    end

    output.sub!('</head>', "#{PUBLICATION_KEYWORD_STYLE}</head>") if inserted && !output.include?('id="publication-keyword-style"')
  end
end

Jekyll::Hooks.register :pages, :post_render do |page|
  next unless page.output_ext == '.html'
  next unless page.output.include?('class="publications"')

  data = page.site.data['publication_keywords'] || {}
  language = page.data['lang'] == 'zh' ? 'zh' : 'en'
  PublicationKeywords.inject(page.output, data, language)
end
