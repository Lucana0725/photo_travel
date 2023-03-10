Rails.application.routes.draw do
  # admin各種resources
  namespace :admin do
    resources :users, only: [:show, :edit, :update]
  end
  
  
  
  
  # ルートパス。ユーザー用なのでpublic
  root to: 'public/homes#top'
  
  # 管理者用のルート。(publicに当てているのでルートパスではない)
  get '/admin' => 'admin/homes#top'
  
  
  
  
  # ゲストログイン用ルーティング
  devise_scope :user do
    post '/users/guest_sign_in' => 'public/sessions#guest_sign_in'
  end
  get 'about' => 'public/homes#about'




  # ユーザー用Devise関連
  # URL /users/sign_in ...
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }




  # 管理者用Devise関連
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  
  
  
  # 各publicルーティング
  scope module: :public do
    # get 'users/mypage' => 'users#show', as: 'mypage'
    # get 'users/information' => 'users#edit', as: 'user_edit'
    # patch 'users/information' => 'users#update', as: 'user_update'
    get 'users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    patch 'users/withdrawal' => 'users#withdrawal', as: 'withdrawal'


    # 各種resources
    resources :users, only: [:show, :edit, :update] do
      member do
        get :favorites
      end
      collection do
        get :search
      end
      resources :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    resources :travels, only: [:new, :create, :index, :show, :destroy] do
      resource :favorites, only: [:create, :destroy]  # 「いいね」は「投稿(travel)」に対して行われるので、いいねのルーティングは投稿(:travels)に結びつく、親子関係となる(ネスト)
      resources :comments, only: [:create, :destroy]  # コメントも「いいね」同様、投稿(travel)に対して行われるので、投稿(:travels)に結びつく。よってネストとなる。
      collection do
        get :search
      end
    end
  end
  # namespace :admin do
  #   root to: 'homes#top'
  # end

  # devise_for :admins
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end