class CreatePartsLists < ActiveRecord::Migration[5.2]
  def change
    create_table :parts_lists do |t|
      t.string :name
      t.string :cpu
      t.string :cpu_cooler
      t.string :motherboard
      t.string :storage
      t.string :video_card
      t.string :case
      t.string :power_supply
      t.string :operating_system
      t.string :monitor
      t.integer :user_id

      t.timestamps
    end
  end
end