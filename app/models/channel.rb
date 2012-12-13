class Channel < ActiveRecord::Base
  belongs_to :organization
  has_many :messages, :dependent => :destroy


  attr_accessible :id, :name
end

