class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.timestamps
      t.string :name
      t.text :introduction
      t.integer :price, :default => 0
      t.boolean :is_active, null: false, default: true
      t.integer :genre_id


    end
  end
end
