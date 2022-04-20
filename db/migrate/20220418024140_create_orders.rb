class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.float :total
      t.date :order_date
      t.string :status, :null => false, :default => "NEW"

      t.timestamps
    end
  end
end
