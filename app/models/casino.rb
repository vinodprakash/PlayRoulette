class Casino < ActiveRecord::Base
	has_many :dealers
	has_many :users, class_name: 'User', foreign_key: 'current_casino_id'

	validates :name, presence: true
	validates :balance_amount, numericality: { only_integer: true, greater_than: 0 }

	include Balance
end
