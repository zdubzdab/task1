class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles
  has_many :tags, through: :articles
  validates :username, presence: true,
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
