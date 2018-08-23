class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :drink
      t.string :coffee_type
      t.integer :milk_amount
      t.integer :sugar_amount
      t.timestamps
    end
end
end