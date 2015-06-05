class User < ActiveRecord::Base
  has_many :articles
  has_many :tags, through: :articles
  has_many :comments
  has_many :raitings
  
  validates :name, presence: true,
                    length: { minimum: 3 },
                    uniqueness: true
  validates :email, presence: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
                    message: "правильний формат emaila: xxx@xxx.xxx" } ,
                    uniqueness: true

  has_attached_file :avatar, :styles => { :large => "400x400>", :display => "150x150#"}, :default_url => "/assets/m.jpg"
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  def confirmation_required?
      false
    end
end
