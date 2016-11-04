class TweetSerializer < ActiveModel::Serializer
  attributes :id, :body, :image_id
  has_one :user

  private

    # def photo_xor_tweet
    #   unless body.blank? ^ photo.blank?
    #     errors.add(:base, "")
    #   end
    # end
    
end
