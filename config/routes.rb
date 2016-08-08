Rails.application.routes.draw do
  resources :vibes
  devise_for :users
  resources :users, :only => [:show]
  resources :causes
  root :to => redirect('/causes')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
