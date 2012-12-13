class Organization < ActiveRecord::Base
  attr_accessible :name, :founding_user_id

  has_many :organizations_users
  has_many :users, :through => :organizations_users

  def founding_user
    user = User.find(self.founding_user_id)
  end
end
