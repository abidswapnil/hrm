Rails.application.routes.draw do
  resources :staffs
  resources :offices

  get "up" => "rails/health#show", as: :rails_health_check

  controller :session do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "session#new"
end
