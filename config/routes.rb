Rails.application.routes.draw do
  devise_for :users
  # root（トップページ「/」）に訪れた際にtopコントローラーのindexアクションを実行
  root 'top#index'
end
