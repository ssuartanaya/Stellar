Rails.application.routes.draw do
  resources :videos
  resources :users, only: [:show]
  devise_for :users
  
  get 'users/:id' => 'users#show'
  root 'videos#index' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
