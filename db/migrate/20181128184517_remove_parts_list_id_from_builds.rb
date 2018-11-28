class RemovePartsListIdFromBuilds < ActiveRecord::Migration[5.2]
  def change
    remove_column :builds, :parts_list_id
  end
end
