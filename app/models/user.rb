class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :organization_ids
  has_secure_password
  has_many :organizations_users
  has_many :organizations, :through => :organizations_users
  has_many :meetings, :through => :organizations
  has_many :messages, :through => :meetings

  validates_presence_of :password, :on => :create
  validates_uniqueness_of :email


  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def founded_orgs
    orgs = Organization.all.reject{|org| org.founding_user != self}
  end
end
