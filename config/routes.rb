Rails.application.routes.draw do

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'users/new', to: 'users#new'  

  get 'users/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :users do
    resources :proposals do
      resources :comments do
      end
        resources :experiments do
          resources :observations do
            resources :comments do
            end
          end
          resources :comments do
          end
        end
        resources :procedures do
          resources :observations do
              resources :comments do
                end
              end
            end
    end
  end
end
