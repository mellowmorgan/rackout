Rails.application.routes.draw do

  # Defines the root path route ("/")
  root to: "home#index" 

  devise_for :users do
    delete "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session_path
  end
  
  resources :users, only: [:index] do
    resources :events do
      resources :earnings
      resources :expenses
    end
  end

  patch "dismiss_all", to: "home#dismiss_all"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
