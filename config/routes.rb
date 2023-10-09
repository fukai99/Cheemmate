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
    root to: 'homes#top'
    resources :comments, only: [:create, :destroy]
    resources :bookmarks, only: [:index, :create, :destroy]
    resources :users, only: [:show, :edit, :update,]
    
    
    resources :posts, only: [:index, :update, :new, :destroy, :edit, :create]
  end

  namespace :admin do
    get 'comments/destroy'
    resources :posts, only: [:index, :show, :destroy]
    resources :users, only: [:show, :edit, :update,]
    patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
    resources :genres, only: [:index, :update, :create, :destroy, :edit]

    get 'homes/top'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
