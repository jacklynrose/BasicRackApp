class ViewArticle
  def initialize(repo, options)
    @repo = repo
    @id = options.delete(:id)
    @slug = options.delete(:slug)
  end

  def result
    { id: @id, slug: @slug }
  end
end
