Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  #resources :users
  resources :users do
    member do
      get :likes
    end
  end
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :likes, only: [:index, :show, :create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  get 'users/my_page' => 'users#show'
  get 'users/unsubscribe' => 'users#unsubscribe'
  patch 'users/withdraw' => 'users#withdraw'
  #put 'withdraw/:id' => 'users#withdraw'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :smoking_informations

end
