class Enrollment < ActiveRecord::Base
  attr_accessible :section_id, :user_id

  belongs_to :user
  belongs_to :section 
end
