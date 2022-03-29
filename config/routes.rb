Rails.application.routes.draw do
  root 'users#index'
  resources :users do
    member do
      get :profile
      patch :update_profile
      get :change_password
      post :update_password
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
