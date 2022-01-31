Rails.application.routes.draw do
  resources :app_configs
  resources :tests, path: '/', only: [:index]
end
