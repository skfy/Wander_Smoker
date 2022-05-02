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
    #resources :smoking_informations
  end

  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :likes, only: [:index, :show, :create, :destroy]
    #resources :comments, only: [:create, :destroy]
  end

  #get 'users/like' => 'users#like'
  #get 'smoking_informations' => 'smoking_informations#index'
  resources :smoking_informations, only: [:index, :create, :new, :update, :destroy]
  #post 'smoking_informations/:user_id' => 'smoking_informations#create'
  #get 'smoking_informations/:user_id' => 'smoking_informations#index'
  get 'smoking_informations/:id' => 'smoking_informations#show'
  get 'smoking_informations/:id/edit' => 'smoking_informations#edit'
  #patch 'smoking_informations/index' => 'smoking_informations#index'
  #put 'withdraw/:id' => 'users#withdraw'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #resources :smoking_informations
  resources :maps, only: [:index]

end
