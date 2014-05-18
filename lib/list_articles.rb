class ListArticles
  def initialize(repo)
    @repo = repo
  end

  def result
    { articles: @repo.all_articles }
  end
end
