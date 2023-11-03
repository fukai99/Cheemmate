Rails.application.routes.draw do


  devise_for :admins, path: "admin/admins",
  skip: [:registrations, :passwords],
  controllers: {
    sessions: "admin/admins/sessions"
  }

  # 管理者とユーザーで区別
  devise_for :users, controllers: {
    sessions: "public/users/sessions",
    passwords: 'public/users/passwords',
    registrations: 'public/users/registrations',
  }

  scope module: :public do
    get "search" => "searches#search"
    root to: 'homes#top'
    resources :users, only: [:show, :edit, :update,]
    resources :posts, only: [:index, :update, :new, :destroy, :edit, :create, :show] do
      resource :youtube_urls, only: [:edit, :update]
      resource :bookmarks, only: [:show, :create, :destroy]
      resources :comments, only: [:create]
      resource :favorites, only: [:create, :destroy]
    end
  end

  namespace :admin do
    get "search" => "searches#search"
    resources :comments, only: [:destroy]
    resources :posts, only: [:index, :show, :destroy]
    resources :users, only: [:show, :edit, :update]
    patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
    resources :genres, only: [:index, :update, :create, :destroy, :edit]
    get 'homes/top'
  end

  devise_scope :user do
    post "users/guest_sign_in", to: "public/users/sessions#guest_sign_in"
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
