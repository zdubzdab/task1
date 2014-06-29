class Article < ActiveRecord::Base
  validates :title, presence: true,
                    length: { minimum: 3 },
                    format: { with: /[a-z]/i,
                    message: " allows only letters" },
                    uniqueness: true
  validates :text, presence: true
end
