class UserSerializer < ActiveModel::Serializer
  attributes :api_token, :firstname, :lastname, :username, :avatar, :id, :followers_count, :followees_count
  has_many :tweets



  def avatar
    Refile.attachment_url(object, :avatar, :fit, 50, 50, format: "jpg")
  end

end
