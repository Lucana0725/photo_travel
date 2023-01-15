Rails.application.routes.draw do
  scope module: :public do
    get 'users/show' => 'users#show', as: 'user_show'
    get 'users/information' => 'users#edit', as: 'user_edit'
    patch 'users/information' => 'users#update', as: 'user_update'
    get 'users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch 'users/withdrawal' => 'users#withdrawal', as: 'withdrawal'
  end
  
  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'
  
  # ユーザー用
  # URL /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  # namespace :admin do
  #   root to: 'homes#top'
  # end
  
  # devise_for :admins
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end