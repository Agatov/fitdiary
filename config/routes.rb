Fitdiary::Application.routes.draw do

  root to: "workouts#index"

  resources :workouts
  resources :exercises do
    resources :sets
  end


  resources :gymnastics
  resources :users
end
