Fitdiary::Application.routes.draw do

  root to: 'application#index'

  resources :workouts, only: [:index, :show, :create, :update, :destroy] do
    resources :exercises, only: :create
  end

  resources :exercises, only: [:show, :update, :destroy] do
    resources :sets, only: :create
  end

  resources :sets, only: [:show, :update, :destroy]


  resources :gymnastics
  resources :users
end
