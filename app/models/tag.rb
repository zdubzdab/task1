class Tag < ActiveRecord::Base
  has_and_belongs_to_many :articles
  def to_s
end
