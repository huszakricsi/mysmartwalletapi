Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/status', to: 'status#status'
  
  get '/currencies', to: 'currencies#getCurrencies'
  
  get '/categories', to: 'categories#getCategories'
  
  post '/accounts', to: 'accounts#createAccount'
  delete '/accounts', to: 'accounts#deleteAccount'
  patch '/accounts', to: 'accounts#editAccount'
  get '/accounts', to: 'accounts#getAccounts'

  post '/transactions', to: 'transactions#createTransaction'
  delete '/transactions', to: 'transactions#deleteTransaction'
  patch '/transactions', to: 'transactions#editTransaction'
  get '/transactions', to: 'transactions#getTransactions'
end
