class Course < ActiveRecord::Base
  attr_accessible :title

  has_many :assignments

  validates_presence_of :title

  belongs_to :user
end
