class Organization < ActiveRecord::Base
  attr_accessible :name
  has_many :organization_users
  has_many :users, :through => :organization_users
end
