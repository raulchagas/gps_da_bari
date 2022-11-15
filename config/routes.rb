Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :dashboards, only: %i[index]
  resources :goals, only: %i[index show new create edit update destroy]
  resources :weights, only: %i[index show new create]
  resources :body_fats, only: %i[index show new create]
  resources :vitamins, only: %i[index show new create edit update destroy]
  resources :recipes, only: %i[index show]
  resources :prescriptions, only: %i[index show new create edit update destroy]
  get "my_vitamins", to: "vitamins#my_vitamins"
end
