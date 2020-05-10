class Api::V1::UsersController < ApplicationController
  
  before_action :get_user, only: [:update_balance, :enter_casino, :bettable_games, :bet_game]
  before_action :get_game, only: [:bet_game]

  def create
  	user = User.new(user_params)
  	if user.save
  		render json: {success: 'success'}, status: 200
  	else
  		render json: {error: 'error'}, status: 400
  	end
  end

  def update_balance
    if @user && @user.update_balance(user_params)
      render json: {success: 'success'}, status: 200
    else
      render json: {error: 'Error'}, status: 422
    end
  end

  def enter_casino
    if @user && @user.update(user_params) 
      render json: {success: 'success'}, status: 200
    else
      render json: {error: 'Error'}, status: 422
    end
  end

  def bettable_games
    active_games = Game.joins(dealer: :casino).where(casinos: {id: @user.current_casino_id}).where(games: {status: Game.statuses[:start]}).to_json(only: [:id, :dealer_id])
    render json: active_games, status: 200
  end

  def users_list
    users = User.all.to_json(only: [:id, :current_casino_id])
    render json: users, status: 200
  end

  def bet_game
    bet = BetDetail.new(bet_game_params)
    if @user && @game && bet.save
      render json: {success: 'success'}, status: 200
    else
      render json: {error: 'error'}, status: 422
    end
  end

  private

  def get_user
    @user = User.find(params[:user_id])
  end

  def get_game
    @game = Game.find(params[:game_id])
  end

  def user_params
  	params.require(:user).permit(:name, :balance_amount, :current_casino_id)
  end

  def bet_game_params
    params.permit(:user_id, :game_id, :amount, :bet_number)
  end
end
