Rails.application.routes.draw do
  resources :exercises
  resources :workout_exercises
  resources :workouts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
