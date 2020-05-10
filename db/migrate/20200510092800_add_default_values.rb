class AddDefaultValues < ActiveRecord::Migration
  def change
  	change_column :users, :balance_amount, :integer, default: 0
  	change_column :casinos, :balance_amount, :integer, default: 0
  end
end
