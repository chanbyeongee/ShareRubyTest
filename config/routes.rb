Rails.application.routes.draw do
  resources :videos
  resources :comments

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'register'
  },
    controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks'
     }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get '/sign_out' => 'devise/sessions#destroy'
    post 'api/login', to: 'api/sessions#create', defaults: { format: :json}
    post 'api/register', to: 'api/registrations#create', defaults: { format: :json}
  end
  get '/current_user', to: 'current_user#index'
  # Defines the root path route ("/")
  root "videos#index"
end
