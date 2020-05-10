module Balance
	extend ActiveSupport::Concern

	def update_balance(amount)
		binding.pry
		amount = amount['balance_amount'] rescue amount
		self.balance_amount += amount
		self.save
	end
end