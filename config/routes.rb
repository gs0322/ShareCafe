Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  # root（トップページ「/」）に訪れた際にtopコントローラーのindexアクションを実行
  root 'top#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    get 'profile_edit', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end

  get 'posts/index' => 'posts#index'
  get 'posts/new' => 'posts#new'
  post 'posts/create' => 'posts/create'
  get 'posts/:id' => 'posts#show'
  get 'posts/:id/edit' => 'posts#edit'
  patch 'posts/:id' => 'posts#update', as: 'post'
  post 'posts/:id/destroy' => 'posts#destroy'

  resources :users, only: %i[show index]
  resources :posts do
    resource :favorites, only: %i[create destroy]
    resources :comments, only: %i[create destroy]
  end

  get 'maps/index' => 'maps#index'
end
