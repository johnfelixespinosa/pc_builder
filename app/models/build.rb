class Build < ApplicationRecord
  belongs_to :user
  belongs_to :parts_list

  has_many_attached :images

  validates :title,          presence: true
  validates :description,    presence: true
  validates :parts_list_id,  presence: true
  
end