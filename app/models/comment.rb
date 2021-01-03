class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :video

  with_options presence: true do
    validates :comment
    validates :user_id
    validates :video_id
  end
end
