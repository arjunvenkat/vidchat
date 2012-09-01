class Course < ActiveRecord::Base
  attr_accessible :description, :objectives, :prequisites, :title, :user_id

  belongs_to :user
  has_many :sections
  
end
