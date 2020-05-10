class AddDefaultStatus < ActiveRecord::Migration
  def change
  	change_column :games, :status, :integer, default: 0
  	change_column :bet_details, :bet_status, :integer, default: 0
  end
end
