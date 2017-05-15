###
# Page options, layouts, aliases and proxies
###
require "active_support/core_ext/integer/inflections"
require 'slim'
# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"

  blog.permalink = "entry/{title}.html"
  # Matcher for blog source files
  blog.sources = "entry/{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  blog.layout = "single"
  blog.summary_separator = /(READMORE)/
  blog.summary_length = 100
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  #blog.tag_template = "tag.html"
  #blog.calendar_template = "calendar.html"

  # Enable pagination
  blog.paginate = true
  #blog.per_page = 5
  blog.page_link = "page/{num}"
end

page "/feed.xml", layout: false
# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
 helpers do
    def reading_time(input)
      words_per_minute = 180

      words = input.split.size
      minutes = (words/words_per_minute).floor
      minutes_label = minutes === 1 ? ' minute' : ' minutes'
      minutes > 0 ? "about #{minutes} #{minutes_label}" : 'less than 1 minute'
    end
 end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end
