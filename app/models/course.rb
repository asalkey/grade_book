class Course < ActiveRecord::Base
  attr_accessible :title

  has_many :assignments

  validates :title, :presence => true
end
