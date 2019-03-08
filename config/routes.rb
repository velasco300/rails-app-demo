Rails.application.routes.draw do
  resources :microposts
  get 'sessions/index'
  resources :permissions
  resources :roles
  resources :users do
    member do
      put 'modify_password'
    end
    collection do
      get 'search'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end