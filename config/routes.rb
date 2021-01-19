Rails.application.routes.draw do

  get 'stars/create'
  root 'exercises#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'complete_signup/:id', to: 'sessions#edit', as: :complete_signup
  patch 'complete_signup/:id', to: 'sessions#update'
  post 'logout', to: 'sessions#destroy'
  get 'auth/:provider/callback', to: 'sessions#omniauth'

  resources :exercises
  resources :muscles do
    resources :exercises, only: [:index, :new, :create]
  end
  resources :workouts

  get 'signup', to: 'users#new'

  resources :users, except: [:new, :show, :edit]
  get '/:username', to: 'users#show', as: :profile
  get '/:username/edit', to: 'users#edit', as: :edit_profile

  get '/:username/workouts', to: 'workouts#index', as: :my_workouts
  get '/:username/starred_workouts', to: 'workouts#index', as: :starred_workouts

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
