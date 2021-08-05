class AddDetailsToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :author, :string
    add_column :items, :artist, :string
  end
end
