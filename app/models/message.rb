class Message < ActiveRecord::Base
  belongs_to :user
  has_one :channel

  validates_presence_of :body, :channel_id

  attr_accessible :id, :body, :name, :channel_id

end
