Fitdiary::Application.routes.draw do

  root to: "workouts#index"

  resources :workouts
  resources :exercises
  resources :sets

  resources :gymnastics
  resources :users
end
