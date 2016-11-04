Rails.application.routes.draw do

  post  '/login' => 'users#login'
  post  '/signup' => 'users#create'
  get   '/users/me' => 'users#self'
  resources :users
  resources :tweets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# 9HKAppkEVtgHeCFuyruHeQXr
