class Casino < ActiveRecord::Base
	has_many :dealers
	has_many :users, class_name: 'User', foreign_key: 'current_casino_id'

	validates :name, presence: true
	validates :balance_amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

	include Balance
end
