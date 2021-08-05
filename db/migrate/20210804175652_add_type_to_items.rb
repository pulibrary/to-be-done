class AddTypeToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :type, :string
  end
end
