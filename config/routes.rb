Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/status', to: 'status#status'
  get '/currencies', to: 'currencies#getCurrencies'
  post '/accounts', to: 'accounts#createAccount'
  delete '/accounts', to: 'accounts#deleteAccount'
  patch '/accounts', to: 'accounts#editAccount'
  get '/accounts', to: 'accounts#getAccounts'
end
