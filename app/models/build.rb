class Build < ApplicationRecord
  has_many_attached :images

  belongs_to :user
  has_one :parts_list

end
