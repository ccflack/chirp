Rails.application.routes.draw do

  post  '/login' => 'users#login'
  post  '/signup' => 'users#create'
  get   '/users/me' => 'users#self'
  get   '/not_followed' => 'users#unfollowed'
  get   '/followed' => 'users#followed'
  post  '/users/:id/follow' => 'users#follow_unfollow'
  get   '/users/:id/followers'  => 'users#all_followers'
  get   '/following/:id' => 'users#follow_flag'
  resources :users
  resources :tweets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# My local api_key: 9HKAppkEVtgHeCFuyruHeQXr
# heroku api_key: b6PmbuZkCzHmqXyLLjoPoMmp
