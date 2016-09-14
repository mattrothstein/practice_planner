Rails.application.routes.draw do


  root to: 'sessions#new'
  resources :sessions
  get 'dashboard' => 'dashboard#dashboard',  as: 'dashboard' 
  # resources :dashboard
  resources :users do
    resources :teams
  end
  resources :practices do
    resources :slots
  end
  post 'practices/:id/practice_sort' => 'practices#sort'
  resources :drills
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
