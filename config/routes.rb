Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  root to: 'homes#top'
  get 'users/my_page' => 'users#show'
  get 'users/unsubscribe' => 'users#unsubscribe'
  patch 'users/withdraw' => 'users#withdraw'
  resources :users, only: [:show, :edit] do
    resources :likes, only: [:create, :destroy]
    member do
      get :likes
    end
  end
  
  resources :posts, only: [:new, :create, :index, :show, :edit, :destroy] do
    resource :likes, only: [:index, :show, :create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  #get 'users/like' => 'users#like'
  #get 'smoking_informations' => 'smoking_informations#index'
  resources :smoking_informations, only: [:show, :index, :update, :destroy]
  #put 'withdraw/:id' => 'users#withdraw'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #resources :smoking_informations
  resources :maps, only: [:index]
  
end
