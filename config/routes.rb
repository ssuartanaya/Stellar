Rails.application.routes.draw do
  devise_for :users
  resources :videos do
  	resources :comments
  end
	resources :replies
  resources :users
  
  root 'videos#index'
  get 'users/:id/follow', to: 'users#follow', as: 'follow'
  delete 'users/:id/unfollow', to: 'users#unfollow', as: 'unfoll'
  get 'users/:id/following', to: 'users#show_follow', as: 'show_follow'
  # get 'users/:id' => 'users#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
