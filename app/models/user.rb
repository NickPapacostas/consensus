class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :organization_ids
  has_secure_password
  has_many :organization_users
  has_many :organizations, :through => :organization_users
  has_many :meetings, :through => :organizations
  has_many :messages, :through => :meetings

  validates_presence_of :password, :on => :create
end
