Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :exercises
  resources :muscles do
    resources :exercises, only: [:index, :new]
  end
  resources :workout_exercises
  resources :workouts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
