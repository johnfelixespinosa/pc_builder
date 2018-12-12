class Build < ApplicationRecord
  belongs_to :user
  belongs_to :parts_list

  has_many_attached :images

  has_many :comments, as: :commentable

  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  validates :title,          presence: true
  validates :description,    presence: true
  validates :parts_list_id,  presence: true

  def first_image
    images.first
  end
  
  def other_images
    images.drop(images.first.id)
  end
  
  scope :most_liked,  ->{ order("likes_count DESC")}
  scope :newest,      ->{ order("created_at DESC")}
  scope :oldest,      ->{ order("created_at ASC")}
  
end