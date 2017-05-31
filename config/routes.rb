Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


resource :users do
  resources :proposals do
    resources :experiments do
      resources :procedures do
        reources :comments, :observations, only [:new, :create, :update, :edit, :delete]
      end
    end
  end
end
