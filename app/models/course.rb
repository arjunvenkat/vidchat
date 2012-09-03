class Course < ActiveRecord::Base
  belongs_to :user_id
  attr_accessible :category_id, :description, :image_url, :prerequisites, :title
end
