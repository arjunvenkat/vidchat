class User < ActiveRecord::Base
  attr_accessible :email, :name, :password_digest, :password, :password_confirmation

  has_secure_password

  has_many :enrollments
  has_many :sections, :through => :enrollments
  
end
