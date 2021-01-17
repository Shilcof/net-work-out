Rails.application.routes.draw do

  root 'exercises#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
  get 'auth/:provider/callback', to: 'sessions#omniauth'

  resources :exercises
  resources :muscles do
    resources :exercises, only: [:index, :new]
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
