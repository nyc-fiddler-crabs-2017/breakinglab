Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


resource :users do
  resources :proposals do
    resources :experiments do
      resources :procedures 
    end
  end
end
