Rails.application.routes.draw do

  root 'exercises#index'

  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'

  resources :exercises
  resources :muscles do
    resources :exercises, only: [:index, :new]
  end
  resources :workout_exercises
  resources :workouts

  # get '/:username', to: 'users#show', as: :user
  resources :users, except: [:new]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
