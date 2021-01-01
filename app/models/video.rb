class Video < ApplicationRecord
  belongs_to :user
  has_one_attached :video

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :genre

  validates :genre_id, numericality: { other_than: 1 } 
  with_options presence: true do
    validates :title
    validates :overview
    validates :video
    validates :user_id
  end
end
