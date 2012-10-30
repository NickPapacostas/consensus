class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password
  has_many :organization_users
  has_many :organizations, :through => :organization_users
  validates_presence_of :password, :on => :create
end
