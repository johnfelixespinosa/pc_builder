class CommentSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :user_id, :build_id, :body, :username
  belongs_to :user
  belongs_to :build
end
