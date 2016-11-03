class User < ApplicationRecord
  has_secure_password
  has_secure_token :api_token
  has_many :users

  def fullname
    :firstname
  end

  validates :username,
            presence: true,
            uniqueness:true


  validates_presence_of :firstname, :username
end
