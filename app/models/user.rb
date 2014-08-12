class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :username,  :uniqueness => { :case_sensitive => false }, :presence => true
  after_create :add_profile
  
  has_one :profile
   
  attr_accessible :login, :username, :email, :password, :password_confirmation, :remember_me, :profile_attributes
  attr_accessor :login
  accepts_nested_attributes_for :profile

  def add_profile
    self.create_profile
  end
  
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions).first
    end
  end
end
