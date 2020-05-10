module Balance
	extend ActiveSupport::Concern

	def update_balance(amount)
		amount = amount['balance_amount'] rescue amount
		self.balance_amount += amount
		self.save
	end
end