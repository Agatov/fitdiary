Fitdiary::Application.routes.draw do

  root to: "workouts#index"

  resources :workouts do
    resources :exercises
  end

  resources :exercises do
    resources :sets
  end


  resources :gymnastics
  resources :users
end
