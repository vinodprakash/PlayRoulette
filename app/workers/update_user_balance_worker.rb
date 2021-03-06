class UpdateUserBalanceWorker
	include Sidekiq::Worker

	def perform(game_id)
		active_game = Game.find(game_id)
		# Won bets
		won_bets = active_game.bet_details.where(bet_number: active_game.thrown_number)
		if won_bets.present?
			won_bets.each do |won_bet|
				won_amount = won_bet.amount * PROFIT_RATIO
				won_bet.user.update_balance(won_amount)
			end
			total_won_amount = won_bets.sum(:amount)
			won_bets.update_all(bet_status: BetDetail.bet_statuses[:won])
			active_game.dealer.casino.update_balance(-total_won_amount)
		end
		# Won bets

		# Lost bets
		loss_bets = active_game.bet_details.where.not(bet_number: active_game.thrown_number)
		if loss_bets.present?
			loss_bets.update_all(bet_status: BetDetail.bet_statuses[:loss])
			total_loss_amount = loss_bets.sum(:amount)
			active_game.dealer.casino.update_balance(total_loss_amount)
		end
		# Lost bets
	end
end