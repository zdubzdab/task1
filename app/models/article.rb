class Article < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :comments, dependent: :destroy
  
  validates :title, presence: true,
                    length: { minimum: 3, maximum: 25}, 
                    uniqueness: true
  validates :text, presence: true
  def to_s
    self.title
  end
end
