class BuildSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  belongs_to :parts_list
end