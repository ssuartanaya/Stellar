Rails.application.routes.draw do
  devise_for :users
  resources :videos do
  	resources :comments
  end
	resources :replies
  resources :users, only: [:show]
  
  
  root 'videos#index'
  get 'users/:id' => 'users#show'
   
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
