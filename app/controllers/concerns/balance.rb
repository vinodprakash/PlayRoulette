module Balance
	extend ActiveSupport::Concern

	def update_balance(amount)
		amount = amount['balance_amount']
		if (amount > 0 && amount.class == Fixnum)
			self.balance_amount += amount
			self.save
		end
	end
end