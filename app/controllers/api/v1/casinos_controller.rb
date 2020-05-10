class Api::V1::CasinosController < ApplicationController
  
  before_action :get_casino, only: [:list_dealers, :update_balance]

  def create
  	casino = Casino.new(create_casino_params)
  	if casino.save
  		render json: {success: 'success'}, status: 200
  	else
  		render json: {error: 'error'}, status: 400
  	end
  end

  def list_dealers
  	if @casino
  		dealers = @casino.dealers.order(id: :asc).to_json(only: [:id, :name])
  		render json: dealers, status: 200
  	else
  		render json: {error: 'Invalid Casino'}, status: 422
  	end
  end

  def update_balance
  	if @casino && @casino.update_balance(update_casino_params)
  		render json:{success: 'success'}, status: 200
  	else
  		render json: {error: 'Error'}, status: 422
  	end
  end

  def list_all_casinos
  	casinos = Casino.all.to_json(only: [:id, :name])
  	render json: casinos, status: 200
  end

  private

  def get_casino
    @casino = Casino.find(params[:casino_id])
  end

  def create_casino_params
  	params.require(:casino).permit(:name)
  end

  def update_casino_params
  	params.require(:casino).permit(:balance_amount)
  end
end