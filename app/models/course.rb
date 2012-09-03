class Course < ActiveRecord::Base
  attr_accessible :description, :objectives, :prerequisite, :title, :user_id, :image_url

  belongs_to :user
  has_many :sections
end
