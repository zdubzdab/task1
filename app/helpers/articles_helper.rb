module ArticlesHelper
  def tag_from_article (array)
    array2 = []
    array.each do |i|
      array2.push(i.name)
    end
    array2.join(', ')
  end
end
