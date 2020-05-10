Rails.application.routes.draw do
  namespace :api do
  namespace :v1 do
      # Casino
      post '/create_casino', to: 'casinos#create'
      get '/list_dealers/:casino_id', to: 'casinos#list_dealers'
      post '/update_balance/:casino_id', to: 'casinos#update_balance'
      get '/list_all_casinos', to: 'casinos#list_all_casinos'
      
      # Dealer
      post '/create_dealer/:casino_id', to: 'dealers#create'
      post '/start_game/:dealer_id', to: 'dealers#start_game'
      post '/end_game/:dealer_id', to: 'dealers#end_game'
      post '/thrown_number/:dealer_id', to: 'dealers#thrown_number'
      get '/users_list', to: 'users#users_list'

      # User
      post '/user_register', to: 'users#create'
      post '/update_user_balance/:user_id', to: 'users#update_balance'
      post '/enter_casino/:user_id', to: 'users#enter_casino'
      get '/bettable_games/:user_id', to: 'users#bettable_games'
      post '/bet_game/:user_id/:game_id', to: 'users#bet_game'
    end
  end

end
