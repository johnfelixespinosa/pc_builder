class CreateCommentsNew < ActiveRecord::Migration[5.2]
  def change
    create_table :comments_news do |t|
      t.references :user, foreign_key: true
      t.references :build, foreign_key: true
      t.integer :user_id
      t.integer :build_id
    end
  end
end
