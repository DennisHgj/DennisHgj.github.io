# frozen_string_literal: true

require 'cgi'

module BilingualSite
  EN_TO_ZH = {
    '/' => '/zh/',
    '/publications/' => '/zh/publications/',
    '/projects/' => '/zh/projects/',
    '/repositories/' => '/zh/repositories/',
    '/cv/' => '/zh/cv/',
    '/news/' => '/zh/news/'
  }.freeze

  NAV_TRANSLATIONS = {
    '/' => '首页',
    '/publications/' => '论文',
    '/projects/' => '项目',
    '/repositories/' => '代码',
    '/cv/' => '简历'
  }.freeze

  UI_TRANSLATIONS = {
    'Oral presentation.' => '口头报告。',
    'Co-first author.' => '共同第一作者。',
    'Student Travel Award' => '学生差旅奖',
    'Outstanding Paper' => '杰出论文',
    'Best Student Paper Nominee' => '最佳学生论文提名',
    'Type to start searching' => '输入关键词开始搜索',
    'Email is the best way to reach me about research and collaboration.' => '如需科研合作或工作交流，欢迎通过邮件联系。'
  }.freeze

  module_function

  def chinese_page?(page)
    page.data['lang'] == 'zh' || page.url.to_s.start_with?('/zh/')
  end

  def counterpart(url, chinese)
    clean_url = url.to_s

    if chinese
      return clean_url.sub(%r{\A/zh/projects/}, '/projects/') if clean_url.start_with?('/zh/projects/') && clean_url != '/zh/projects/'

      EN_TO_ZH.key(clean_url) || '/'
    else
      return clean_url.sub(%r{\A/projects/}, '/zh/projects/') if clean_url.start_with?('/projects/') && clean_url != '/projects/'

      EN_TO_ZH.fetch(clean_url, '/zh/')
    end
  end

  def absolute_url(site, path)
    "#{site.config['url']}#{site.config['baseurl']}#{path}"
  end

  def replace_chinese_navigation(output, current_url)
    NAV_TRANSLATIONS.each do |english_path, chinese_title|
      escaped_path = Regexp.escape(english_path)
      output.gsub!(%r{(<a class="nav-link" href=")#{escaped_path}("[^>]*>).*?(</a>)}m) do
        "#{Regexp.last_match(1)}/zh#{english_path == '/' ? '/' : english_path}#{Regexp.last_match(2)}#{chinese_title}#{Regexp.last_match(3)}"
      end
    end

    output.gsub!(%r{(<a class="navbar-brand title font-weight-lighter" href=")[^"]*(")}m, '\1/zh/\2')
    if current_url == '/zh/'
      output.sub!(%r{<li class="nav-item\s*">\s*<a class="nav-link" href="/zh/">首页</a>\s*</li>}m, '<li class="nav-item active"><a class="nav-link" href="/zh/">首页</a></li>')
    end
  end

  def remove_home_brand(output)
    output.sub!(%r{<a class="navbar-brand title font-weight-lighter" href="/zh/">.*?</a>}m, '')
  end

  def translate_chinese_ui(output)
    UI_TRANSLATIONS.each { |english, chinese| output.gsub!(english, chinese) }
    output.gsub!(/(\d+) more authors/, '\1 位其他作者')
    output.gsub!('Open search', '打开搜索')
    output.gsub!('Change color theme', '切换配色主题')
    output.gsub!('Change theme', '切换主题')
  end

  def add_language_switch(output, href, label, title)
    item = <<~HTML.strip
      <li class="nav-item language-switcher"><a class="nav-link" href="#{CGI.escapeHTML(href)}" hreflang="#{label == '中文' ? 'zh-CN' : 'en'}" title="#{CGI.escapeHTML(title)}">#{label}</a></li>
    HTML

    search_marker = /(<li class="nav-item">\s*<button id="search-toggle")/
    theme_marker = /(<li class="toggle-container">\s*<button id="light-toggle")/

    if output.match?(search_marker)
      output.sub!(search_marker, "#{item}\\1")
    elsif output.match?(theme_marker)
      output.sub!(theme_marker, "#{item}\\1")
    end
  end

  def add_language_metadata(output, site, english_path, chinese_path, chinese)
    output.sub!(/<html lang="[^"]+">/, '<html lang="zh-CN">') if chinese

    alternates = <<~HTML
      <link rel="alternate" hreflang="en" href="#{CGI.escapeHTML(absolute_url(site, english_path))}">
      <link rel="alternate" hreflang="zh-CN" href="#{CGI.escapeHTML(absolute_url(site, chinese_path))}">
      <link rel="alternate" hreflang="x-default" href="#{CGI.escapeHTML(absolute_url(site, english_path))}">
    HTML
    output.sub!('</head>', "#{alternates}</head>")
  end
end

Jekyll::Hooks.register :pages, :post_render do |page|
  next unless page.output_ext == '.html'
  next unless page.output.include?('id="navbar"')

  chinese = BilingualSite.chinese_page?(page)
  alternate_path = BilingualSite.counterpart(page.url, chinese)
  english_path = chinese ? alternate_path : page.url
  chinese_path = chinese ? page.url : alternate_path

  BilingualSite.replace_chinese_navigation(page.output, page.url) if chinese
  BilingualSite.remove_home_brand(page.output) if page.url == '/zh/'
  BilingualSite.translate_chinese_ui(page.output) if chinese
  BilingualSite.add_language_switch(
    page.output,
    alternate_path,
    chinese ? 'English' : '中文',
    chinese ? 'Switch to English' : '切换到中文'
  )
  BilingualSite.add_language_metadata(page.output, page.site, english_path, chinese_path, chinese)
end

Jekyll::Hooks.register :documents, :post_render do |document|
  next unless document.output_ext == '.html'
  next unless document.output.include?('id="navbar"')

  alternate_path = BilingualSite.counterpart(document.url, false)
  BilingualSite.add_language_switch(document.output, alternate_path, '中文', '切换到中文')
  BilingualSite.add_language_metadata(document.output, document.site, document.url, alternate_path, false)
end
