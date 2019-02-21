class LikeSerializer < ActiveModel::Serializer
  attributes :id, :build_id, :user_id
  belongs_to :user
  belongs_to :build, counter_cache: true
end
