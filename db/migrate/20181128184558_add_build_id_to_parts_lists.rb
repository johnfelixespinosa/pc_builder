class AddBuildIdToPartsLists < ActiveRecord::Migration[5.2]
  def change
    add_column :parts_lists, :build_id, :integer
  end
end
