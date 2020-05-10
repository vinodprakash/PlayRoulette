class UpdateUserBalanceWorker
	include Sidekiq::Worker

	def perform(game_id)
		active_game = Game.find(game_id)
		# Won bets
		won_bets = active_game.bet_details.where(bet_number: active_game.thrown_number)
		amount_from_casino = 0
		won_bets.each do |won_bet|
			won_amount = won_bet.amount * PROFIT_RATIO
			won_bet.user.update_balance(won_amount)
			amount_from_casino += won_amount
		end
		won_bets.update_all(bet_status: BetDetail.bet_statuses[:won])
		active_game.dealer.casino.update_balance(-(amount_from_casino/PROFIT_RATIO))
		# Won bets

		# Lost bets
		loss_bets = active_game.bet_details.where.not(bet_number: active_game.thrown_number)
		loss_bets.update_all(bet_status: BetDetail.bet_statuses[:loss])
		loss_amount = loss_bets.sum(:amount)
		active_game.dealer.casino.update_balance(loss_amount)
		# Lost bets
	end
end