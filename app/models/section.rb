class Section < ActiveRecord::Base
  attr_accessible :session_id, :user_id, :course_id, :date, :time

  has_many :enrollments 
  has_many :users, :through => :enrollments
  belongs_to :course
end
