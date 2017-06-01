Rails.application.routes.draw do

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :users, except: [:index] do
    resources :proposals do
      resources :comments do
      end
        resources :experiments, except: [:index] do
          resources :procedures, except: [:index] do
            resources :observations, only: [:new, :create] do
              resources :comments, only: [:new, :create]  do
              end
            end
          end
          resources :observations, only: [:new, :create]  do
            resources :comments, only: [:new, :create]  do
            end
          end
          resources :comments, only: [:new, :create] do
          end
        end
    end
  end

  root 'proposals#index'

end
