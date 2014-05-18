require 'psych'
require 'mustache'
require 'in_memory_repo'
require 'list_articles'
require 'view_article'
require 'missing_page'

class Router
  def call(env)
    puts env
    case "#{env['REQUEST_METHOD']} #{env['REQUEST_PATH']}"
    when /^GET \/$/
      render ListArticles.new(repo)
    when /^GET \/articles\.json$/
      render_json ListArticles.new(repo)
    when /^GET \/articles\/(\d+)\/(.+)$/
      render ViewArticle.new(repo, id: $1, slug: $2)
    when /^GET \/articles\/(\d+)\/(.+)\.json$/
      render_json ViewArticle.new(repo, id: $1, slug: $2)
    else
      render_404
    end
  end

  private

  def repo
    @repo = InMemoryRepo.new
  end

  def render(control)
    File.open("views/#{control.class}.mustache") do |file|
      rendering = Mustache.render(file.read, control.result)
      [200, {}, [rendering]]
    end
  end

  def render_json(control)
    [200, {}, [Psych.to_json(control.result)]]
  end

  def render_404
    [404, {}, [Psych.to_json(MissingPage.new.result)]]
  end
end
