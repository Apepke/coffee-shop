class CreateFullOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :full_orders do |t|
      t.string :fullorder
      t.string :order_status
      t.string :order_company_name
      t.timestamps
    end
  end
end
