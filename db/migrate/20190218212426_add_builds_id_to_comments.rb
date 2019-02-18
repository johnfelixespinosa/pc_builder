class AddBuildsIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :build_id, :integer
  end
end
