class User < ActiveRecord::Base
	has_many :bet_details

	validates :name, presence: true
	validates :balance_amount, numericality: { only_integer: true, greater_than: 0 }

	include Balance

	def current_casino
		Casino.find(self.current_casino_id)
	end
end
