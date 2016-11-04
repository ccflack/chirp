class User < ApplicationRecord
  has_secure_password
  has_secure_token :api_token
  has_many :tweets
  attachment :avatar
  acts_as_followable
  acts_as_follower


  validates :username,
            presence: true,
            uniqueness:true


  validates_presence_of :firstname, :username, :password
end
