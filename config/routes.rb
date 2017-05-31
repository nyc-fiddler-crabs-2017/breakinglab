Rails.application.routes.draw do
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

  root 'proposals#index'

end
