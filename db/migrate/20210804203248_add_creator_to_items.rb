class AddCreatorToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :creator, :string
  end
end
