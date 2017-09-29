Rails.application.routes.draw do
  get 'pages/home'

  devise_for :users
  
  get '/truelayer' => 'truelayer#authenticate'
  get '/truelayer/callback' => 'truelayer#callback'
  get '/truelayer/access_token_callback' => 'truelayer#access_token_callback'



end
