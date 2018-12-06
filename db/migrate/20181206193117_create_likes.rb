class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :build
      t.references :user

      t.timestamps
    end
  end
end
