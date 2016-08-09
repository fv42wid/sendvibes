Rails.application.routes.draw do

  resources :vibes
  devise_for :users do
    resource :comments, module: :causes
  end
  resources :users, :only => [:show]
  resources :causes do
    resource :comments, module: :causes
  end
  root :to => redirect('/causes')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
