class Api::V1::DealersController < ApplicationController
  
  before_action :get_casino, only: [:create]
  before_action :get_dealer, only: [:start_game, :end_game, :thrown_number]

  def create
  	dealer = @casino.dealers.new(create_dealer_params) rescue nil
  	if @casino && dealer.save
  		render json: {success: 'success'}, status: 200
  	else
  		render json: {error: 'error'}, status: 422
  	end
  end

  def start_game
    if @dealer && @dealer.no_active_games && @dealer.games.create
      render json: {success: 'success'}, status: 200
    else
      render json: {error: 'error'}, status: 422
    end
  end

  def end_game
    if @dealer
      active_game = @dealer.active_game
      if active_game && active_game.update(end_time: DateTime.now)
        render json: {success: 'success'}, status: 200
      else
        render json: {error: 'error'}, status: 422
      end
    else
      render json: {error: 'error'}, status: 422
    end
  end

  def thrown_number
    if @dealer
      active_game = @dealer.last_ended_game
      if active_game && params[:thrown_number].present? && active_game.update(thrown_number: params[:thrown_number])
        UpdateUserBalanceWorker.perform_async(active_game.id)
        render json: {success: 'success'}, status: 200
      else
        render json: {error: 'error'}, status: 422
      end
    else
      render json: {error: 'error'}, status: 422
    end
  end

  private

  def get_casino
    @casino = Casino.find(params[:casino_id])
  end

  def get_dealer
    @dealer = Dealer.find(params[:dealer_id])
  end

  def create_dealer_params
  	params.require(:dealer).permit(:name)
  end
end
