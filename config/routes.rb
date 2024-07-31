Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "cvs#index"
  resources :cvs do
    member do
      delete :destroy_avatar
    end
  end
end
