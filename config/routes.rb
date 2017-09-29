Rails.application.routes.draw do

  devise_for :users
  
  get '/' => 'pages#home'
  get '/truelayer' => 'truelayer#authenticate'
  get '/truelayer/callback' => 'truelayer#callback'
  get '/truelayer/access_token_callback' => 'truelayer#access_token_callback'
  get '/starling_bank/callback' => 'starling_bank#callback'
end
