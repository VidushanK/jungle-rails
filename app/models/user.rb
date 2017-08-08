class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  validates :full_name, presence: true
  validates :email, :presence => true,  :uniqueness => { :case_sensitive => false }, :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  validates :password, :length => {:within => 6..40}
  validates :password_confirmation, :length => {:within => 6..40}


end
