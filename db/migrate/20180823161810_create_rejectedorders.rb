class CreateRejectedorders < ActiveRecord::Migration[5.2]
  def change
    create_table :rejectedorders do |t|
      t.string :rejected_order
      t.string :comment

      t.timestamps
    end
  end
end
