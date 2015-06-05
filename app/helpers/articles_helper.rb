module ArticlesHelper
  def tag_from_article (array)
    array.map! { |a| a.name }
    array.join(', ')
  end
end
