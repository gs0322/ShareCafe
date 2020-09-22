Rails.application.routes.draw do
  # root（トップページ「/」）に訪れた際にtopコントローラーのindexアクションを実行
  root 'top#index'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  get "posts/index" => "posts#index" 
  get "posts/new" => "posts#new"
  post "posts/create" => "posts/create"
end
