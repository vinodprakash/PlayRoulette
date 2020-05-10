class CreateBetDetails < ActiveRecord::Migration
  def change
    create_table :bet_details do |t|
      t.integer :bet_number
      t.integer :amount
      t.datetime :betting_time
      t.references :user, index: true
      t.references :game, index: true
      t.integer :bet_status

      t.timestamps
    end
  end
end
