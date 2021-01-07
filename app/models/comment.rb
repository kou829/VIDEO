class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :video

  with_options presence: true do
    validates :text
    validates :user_id
    validates :video_id
  end
end
