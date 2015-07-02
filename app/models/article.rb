class Article < ActiveRecord::Base
  belongs_to :user, touch: true
  has_and_belongs_to_many :tags
  has_many :comments, dependent: :destroy
  has_many :raitings, dependent: :destroy

  validates :title, presence: true,
                    length: { minimum: 3, maximum: 25},
                    uniqueness: true
  validates :text, presence: true
  
  def to_s
    self.title
  end

  def self.search(query)
    where("title like ?", "%#{query}%") 
  end

  def self.touch#update cache in articles table after tag updating
    update_all(updated_at: Time.now)
  end

end
