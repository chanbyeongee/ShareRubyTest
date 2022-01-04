Rails.application.routes.draw do
  resources :videos
  resources :comments

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Defines the root path route ("/")
  root "videos#index"
end
