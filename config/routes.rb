Rails.application.routes.draw do
  devise_for :users
   root to: "rooms#index"
   resources :users, only: [:edit, :update, :show] 
 
 resources :suggestions do 
  resources :share_messages, only: [:index, :create, :destroy, :edit, :update]
 end

 resources :rooms, only: [:new, :create, :destroy] do
  resources :messages, only: [:index, :create, :destroy, :edit, :update]
 end
end
