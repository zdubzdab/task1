class Tag < ActiveRecord::Base
  has_and_belongs_to_many :articles
  has_many :users, through: :articles

  #def to_s
   # self.name
  #end
end 
