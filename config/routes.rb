Fitdiary::Application.routes.draw do
  resources :workouts
  resources :exercises
  resources :sets

  resources :gymnastics
  resources :users
end
