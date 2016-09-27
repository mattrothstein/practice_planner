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
  resources :drills
  get 'my_drills' => 'drills#my_drills', as: 'my_drills'
  get 'drills/:id/copy_drill' => 'drills#copy_drill', as: 'copy_drill'
  
  get 'my_practices' => 'practices#my_practices', as: 'my_practices'
  get 'practices/:id/copy_practice' => 'practices#copy_practice', as: 'copy_practice'
  post 'practices/:id/duplicate' => 'practices#duplicate', as: 'duplicate_practice'
  
  post 'practices/:id/practice_sort' => 'practices#sort'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
