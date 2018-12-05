class Build < ApplicationRecord
  belongs_to :user
  belongs_to :parts_list

  has_many_attached :images

  validates :title,          presence: true
  validates :description,    presence: true
  validates :parts_list_id,  presence: true

  def first_image
    images.first
  end
  
  def other_images
    images.drop(1)
  end

  scope :newest, ->{ order("created_at DESC")}
  scope :oldest, ->{ order("created_at ASC")}
  
end