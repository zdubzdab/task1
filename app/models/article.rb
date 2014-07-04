class Article < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true,
                    length: { minimum: 3 },
                    format: { with: /\A[a-z]+\z/i,
                    message: " allows only letters" },
                    uniqueness: true
  validates :text, presence: true
end 
