class UserSerializer < ActiveModel::Serializer
  attributes :api_token, :firstname, :lastname, :username, :avatar
end
