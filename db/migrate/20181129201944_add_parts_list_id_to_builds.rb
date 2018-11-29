class AddPartsListIdToBuilds < ActiveRecord::Migration[5.2]
  def change
    add_column :builds, :parts_list_id, :integer
  end
end
