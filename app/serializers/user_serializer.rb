class UserSerializer < ActiveModel::Serializer
  attributes :api_token, :firstname, :lastname, :username, :avatar
  has_many :tweets



  def avatar
    Refile.attachment_url(object, :avatar, :fit, 100, 100, format: "jpg")
  end

end
