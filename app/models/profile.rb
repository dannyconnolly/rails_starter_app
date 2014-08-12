class Profile < ActiveRecord::Base
  attr_accessible :fax, :phone_1, :phone_2, :url
  
  belongs_to :user
end