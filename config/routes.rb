Rails.application.routes.draw do

  root 'static_pages#home'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users
  resources :courses
  resources :grades
  resources :enrollments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
