class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :name
      t.string :status
      t.string :link
      t.integer :rating
      t.text :notes

      t.timestamps
    end
  end
end
