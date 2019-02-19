class BuildSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  belongs_to :user
  belongs_to :parts_list

  has_many :comments, as: :commentable, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user
end