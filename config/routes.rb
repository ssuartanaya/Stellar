Rails.application.routes.draw do
  devise_for :users
  resources :videos do
  	resources :comments
    member do
      put "like" => "videos#upvote"
      put "unlike" => "videos#downvote"
    end
  end
	resources :replies
  resources :users do
    member do 
      get 'users/:id/follow', to: 'users#follow', as: 'follow'
      get 'users/:id/following', to: 'users#show_follow', as: 'show_follow'
      delete 'users/:id/unfollow', to: 'users#unfollow', as: 'unfoll'
      get 'notif', to: 'users#notif', as: 'notif'
      get 'accept/:following_id', to: 'users#accept', as: 'accept'
      delete 'decline/:following_id', to: 'users#decline', as: 'decline'
      # delete 'users/:id/unfollow', as: 'unfoll'
      # get 'users/:id/following', as: 'show_follow'  
    end  
  end  

  
  root 'videos#index'
  
  # get 'users/:id' => 'users#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
