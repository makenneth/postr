Rails.application.routes.draw do
   root 'subs#index'

  resources :users, except: [:show] do
       post 'add_admin', on: :member
       post 'remove_admin', on: :member
  end
  resource :session, only: [:new, :create, :destroy]
  resources :subs do
    resources :posts, only: [:new, :create]
  end

  resources :posts, except: [:new, :create, :index] do
      post 'up_vote', on: :member
      post 'down_vote', on: :member
  end

  resources :comments, only: [:new, :create] do
     post 'up_vote', on: :member
     post 'down_vote', on: :member
  end
end
