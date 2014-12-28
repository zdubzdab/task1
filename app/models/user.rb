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

  has_attached_file :avatar, :styles => { :large => "500x500>", :display => "200x200>"}, :default_url => "/assets/m.jpg"
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Overridden to notify users with password changes
  def update_with_password(params, *options)
    if super
      # TODO schedule this in the background
      UserMailer.password_changed(self.id).deliver
    end
  end
  
def confirmation_required?
  false
end

end
