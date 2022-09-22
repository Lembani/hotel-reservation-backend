Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json },
              controllers: {
                  sessions: 'users/sessions',
                  registrations: 'users/registrations'
              }

  namespace :api do
    namespace :v1 do
     resources :categories, only: [:index, :show, :edit, :create, :update, :destroy, :hotels] do
        get 'hotels' => 'categories#hotels'
      end
      resources :hotels do
        resources :reservations
      end
    end
  end
end
