class Assignment < ActiveRecord::Base
  attr_accessible :grade, :name

  belongs_to :course
  belongs_to :user
end
