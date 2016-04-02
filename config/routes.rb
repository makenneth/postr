Rails.application.routes.draw do

  get 'comments/new'

  resources :users, except: [:show]
  resource :session, only: [:new, :create, :destroy]
  resources :subs do
    resources :posts, only: [:new, :create]
  end
  resources :posts, except: [:new, :create, :index]
  resources :comments, only: [:new, :create]
end
