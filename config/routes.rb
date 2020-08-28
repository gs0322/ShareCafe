Rails.application.routes.draw do
  # root（トップページ「/」）に訪れた際にtopコントローラーのindexアクションを実行
  root 'top#index'
end
