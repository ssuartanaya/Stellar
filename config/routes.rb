Rails.application.routes.draw do
  devise_for :users
  resources :videos
  resources :users
  
  # get 'users/:id' => 'users#show'
  # get 'users/:id' => 'users#edit', as: 'edit'
  root 'videos#index' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
