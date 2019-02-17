class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :user_id
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
end
