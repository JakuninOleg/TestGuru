Rails.application.routes.draw do
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

  root 'static_pages#home'

  get '/about', to: 'static_pages#about'
  get '/about/author', to: 'static_pages#author'
end
