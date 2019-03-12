Rails.application.routes.draw do
  get 'sessions/login', to: 'sessions#login'
  get 'sessions/index', to: 'sessions#index'
  resources :microposts
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
  match '*path' => proc { |env| ApplicationController.action(:render_not_found).call(env) }, via: :all
end
