class CreateMenuitems < ActiveRecord::Migration[7.0]
  def change
    create_table :menuitems do |t|
      t.string :name
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
