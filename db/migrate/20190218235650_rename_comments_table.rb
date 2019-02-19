class RenameCommentsTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :comments_news, :comments
  end
end
