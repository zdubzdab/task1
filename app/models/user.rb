class User < ActiveRecord::Base
  has_many :articles
  validates :name, presence: true,
                    length: { minimum: 3 },
                    format: { with: /\A[a-z]+\z/i,
                    message: " allows only letters" },
                    uniqueness: true
  validates :email, presence: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
                    message: "правильний формат emaila: xxx@xxx.xxx" } ,
                    uniqueness: true
end                    
