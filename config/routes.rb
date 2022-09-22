Rails.application.routes.draw do
  devise_for :users,
              controllers: {
                  sessions: 'users/sessions',
                  registrations: 'users/registrations'
              }

  namespace :api do
    namespace :v1 do
      resources :categories
      resources :hotels do
        resources :reservations
      end
    end
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
