Rails.application.routes.draw do

  resources :tweets
  post '/login' => 'users#login'
  post '/signup' => 'users#create'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
