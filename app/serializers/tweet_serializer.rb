class TweetSerializer < ActiveModel::Serializer
  attributes :id, :body, :image_id
  has_one :user
end
