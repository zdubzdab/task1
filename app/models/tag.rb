class Tag < ActiveRecord::Base
  before_save :touch_articles

  has_and_belongs_to_many :articles
  has_many :users, through: :articles

  validates :name, presence: true

  def touch_articles#update cache in articles table
    articles.touch
  end

end
