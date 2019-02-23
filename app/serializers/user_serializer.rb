class UserSerializer < ActiveModel::Serializer
  attributes :id, :username

  has_many :parts_lists
  has_many :builds
  has_many :comments

  has_many :likes
  has_many :liked_builds
end