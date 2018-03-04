Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tests do
    resources :questions, shallow: true
  end

  root 'static_pages#home'

  get '/about', to: 'static_pages#about'
  get '/about/author', to: 'static_pages#author'
end
