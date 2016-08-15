Rails.application.routes.draw do

  resources :charges
  resources :vibes
  devise_for :users
  resources :users, :only => [:show] do
    resource :comments, module: :users
  end
  resources :causes do
    resource :comments, module: :causes
  end
  resources :sponsors

  root :to => redirect('/causes')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
