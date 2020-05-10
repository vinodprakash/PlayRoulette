class CreateCasinos < ActiveRecord::Migration
  def change
    create_table :casinos do |t|
      t.string :name
      t.integer :balance_amount

      t.timestamps
    end
  end
end
