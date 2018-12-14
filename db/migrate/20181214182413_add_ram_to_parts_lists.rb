class AddRamToPartsLists < ActiveRecord::Migration[5.2]
  def change
    add_column :parts_lists, :ram, :string
  end
end
