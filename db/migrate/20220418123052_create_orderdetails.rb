class CreateOrderdetails < ActiveRecord::Migration[7.0]
  def change
    create_table :orderdetails do |t|
      t.integer :order_id
      t.integer :menuitem_id
      t.integer :quantity
      t.float :price
      t.float :total

      t.timestamps
    end
  end
end
