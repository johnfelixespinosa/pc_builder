class Build < ApplicationRecord
  has_many_attached :images

  has_one :parts_list
  has_one :user, through: :parts_list

end
