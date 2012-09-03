class Course < ActiveRecord::Base
  attr_accessible :description, :objectives, :prerequisites, :title, :user_id, :image_url

  belongs_to :user
  has_many :sections
end
