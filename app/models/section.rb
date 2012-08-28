class Section < ActiveRecord::Base
  attr_accessible :session_id, :user_id

  has_many :enrollments 
  has_many :users, :through => :enrollments
end
