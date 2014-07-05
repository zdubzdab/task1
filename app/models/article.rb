class Article < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true,
                    length: { minimum: 3 },
                    uniqueness: true
  validates :text, presence: true
end 
