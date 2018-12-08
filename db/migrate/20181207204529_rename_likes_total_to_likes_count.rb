class RenameLikesTotalToLikesCount < ActiveRecord::Migration[5.2]
  def change
    rename_column :builds, :likes_total, :likes_count
  end
end
