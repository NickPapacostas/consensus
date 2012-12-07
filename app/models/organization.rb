class Organization < ActiveRecord::Base
  attr_accessible :name
  has_many :organizations_users
  has_many :users, :through => :organizations_users
end
