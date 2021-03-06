class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :name, :string
  	add_column :users, :username, :string
   	add_column :users, :company_name, :string, :default => ""
   	add_column :users, :favorite_order, :string, :default => ""
  	add_index :users, :username, unique: true
  end
end
