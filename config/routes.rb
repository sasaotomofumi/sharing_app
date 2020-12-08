Rails.application.routes.draw do
  devise_for :users
   devise_scope :user do 
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
   end
   
   root to: "rooms#index"
   resources :users, only: [:edit, :update, :show, :destroy] 
 
 resources :suggestions do 
  resources :share_messages, only: [:index, :create, :destroy, :edit, :update]
   collection do 
    get 'search'
   end
 end

 resources :rooms, only: [:new, :create, :destroy] do
  resources :messages, only: [:index, :create, :destroy, :edit, :update]
 end
end
