module UsersHelper
  def article_from_user (ar1)
    ar2 = []
    ar1.each do |i|
      ar2.push(i.title)
    end
    ar2.join(', ')
  end

end
