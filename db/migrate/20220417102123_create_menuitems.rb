class CreateMenuitems < ActiveRecord::Migration[7.0]
  def change
    create_table :menuitems do |t|
      t.string :name
      t.text :description
      t.float :price, :null => false, :default => 1.0

      t.timestamps
    end
  end
end
