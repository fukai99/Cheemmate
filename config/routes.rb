Rails.application.routes.draw do
  namespace :public do
    get 'homes/top'
  end
  namespace :public do
    get 'comments/create'
    get 'comments/destroy'
  end
  namespace :public do
    get 'bookmarks/create'
    get 'bookmarks/destroy'
    get 'bookmarks/index'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    get 'users/withdrawal'
  end
  namespace :public do
    get 'posts/index'
    get 'posts/new'
    get 'posts/edit'
    get 'posts/update'
    get 'posts/destroy'
  end
  namespace :admin do
    get 'comments/destroy'
  end
  namespace :admin do
    get 'posts/show'
    get 'posts/index'
    get 'posts/destroy'
  end
  namespace :admin do
    get 'users/show'
    get 'users/edit'
    get 'users/update'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
    get 'genres/destroy'
  end
  namespace :admin do
    get 'homes/top'
  end
  devise_for :bookmarks
  devise_for :comments
  devise_for :genres
  devise_for :posts
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
