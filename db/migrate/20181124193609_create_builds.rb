class CreateBuilds < ActiveRecord::Migration[5.2]
  def change
    create_table :builds do |t|
      t.string :title
      t.text :description
      t.integer :parts_list_id

      t.timestamps
    end
  end
end
