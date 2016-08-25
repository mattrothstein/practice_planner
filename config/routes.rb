Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :sessions
  resources :users do
    resources :teams
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
