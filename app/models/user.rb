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

  def following
    if current_user
      object.followed_by?(current_user)
    else
      false
    end
  end


  validates_presence_of :firstname, :username, :password
end
