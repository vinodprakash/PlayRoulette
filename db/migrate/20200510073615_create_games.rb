class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :dealer, index: true
      t.datetime :start_time
      t.datetime :end_time
      t.integer :status
      t.integer :thrown_number

      t.timestamps
    end
  end
end
