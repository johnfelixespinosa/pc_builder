class ChangeLikesCountDefaultToZero < ActiveRecord::Migration[5.2]
  def change
    change_column_default :builds, :likes_count, 0
  end
end
