Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#home'

  get '/about', to: 'static_pages#about'
  get '/about/author', to: 'static_pages#author'
  get 'users/new'
  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  delete :quit, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
