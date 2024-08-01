Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "cvs#index"
  resources :cvs do
    member do
      delete :destroy_avatar
    end
    resources :content_blocks, only: :create do
      collection do
        patch :change_position
      end
    end
  end
  resources :documents, only: %i[ create update destroy ]
  resources :paragraphs, only: %i[ create update destroy ]
  resources :images, only: %i[ create update destroy ]
end
