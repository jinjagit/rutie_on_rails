Rails.application.routes.draw do
  resources :app_configs
  get '/', to: 'hello#hello'
  get 'arrays/reverse', to: 'arrays#reverse'
  get 'arrays/blocked_words', to: 'arrays#blocked_words'
end
