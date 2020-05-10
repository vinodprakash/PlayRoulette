class User < ActiveRecord::Base
	has_many :bet_details
	belongs_to :current_casino, class_name: 'Casino', foreign_key: 'current_casino_id'

	validates :name, presence: true
	validates :balance_amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

	include Balance

end
