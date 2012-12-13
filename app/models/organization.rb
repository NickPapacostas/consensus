class Organization < ActiveRecord::Base
  attr_accessible :name, :channel, :founding_user_id

  has_one :channel, :dependent => :destroy
  has_many :organizations_users
  has_many :users, :through => :organizations_users

  after_create :create_channel

  def create_channel
    self.channel = Channel.find_or_create_by_name(self.name)
  end

  def founding_user
    user = User.find(self.founding_user_id)
  end
end
