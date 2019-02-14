class PartsListSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :builds
end
