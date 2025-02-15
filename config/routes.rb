Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root 'home#index'
  get 'home/index'
  get 'landing/index'
  
  # Rotas Scaffold
  resources :funcoes
  resources :categorias
  resources :prestantes

  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
end
