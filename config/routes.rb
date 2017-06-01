Rails.application.routes.draw do

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :users do
    resources :proposals do
      resources :comments do
      end
        resources :experiments do
          resources :procedures do
            resources :observations do
              resources :comments do
              end
            end
          end
          resources :observations do
            resources :comments do
            end
          end
          resources :comments do
          end
        end
    end
  end

  root 'proposals#index'

end
