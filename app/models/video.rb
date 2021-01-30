class Video < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :video
  has_many :like, dependent: :destroy

  def self.search(search)
    if search != ""
      Video.where('title LIKE(?)', "%#{search}%")
    else
      Video.all
    end
  end

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
