class User < ActiveRecord::Base
  has_many :articles
  has_many :tags, through: :articles
  validates :name, presence: true,
                    length: { minimum: 3 },
                    format: { with: /\A[a-z]+\z/i,
                    message: " allows only letters" },
                    uniqueness: true
  validates :email, presence: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
                    message: "правильний формат emaila: xxx@xxx.xxx" } ,
                    uniqueness: true

  # def to_s
  #   self.name
  # end

end
