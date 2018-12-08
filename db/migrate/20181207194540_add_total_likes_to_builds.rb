class AddTotalLikesToBuilds < ActiveRecord::Migration[5.2]
  def change
    add_column :builds, :likes_total, :integer
  end
end
