class Tweet < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :user
  validates :body, length: { maximum: 165,
    too_long: "165 characters is the maximum allowed"
    }

  def self.timeline(user)
    following_ids = user.followees(User).pluck(:id)
    all_ids= following_ids << user.id
    Post.where(user_id: all_ids)
  end


end
