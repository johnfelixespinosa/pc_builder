class RemovePolyCommentsAgain2 < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :commentable_type
    remove_column :comments, :commentable_id
  end
end
