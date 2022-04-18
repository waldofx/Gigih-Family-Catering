class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :phone
      t.string :address
      t.string :email

      t.timestamps
    end
  end
end
