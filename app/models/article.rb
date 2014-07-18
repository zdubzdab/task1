class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :tags
  has_and_belongs_to_many :tags
  validates :title, presence: true,
                    length: { minimum: 3 },
                    uniqueness: true
  validates :text, presence: true
  def to_s
  end
end  
