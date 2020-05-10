class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :balance_amount
      t.integer :current_casino_id

      t.timestamps
    end
    add_index :users, :current_casino_id
  end
end
