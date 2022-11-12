Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :dashboards, only: %i[index]
  resources :goals, only: %i[index show new create edit destroy]
  resources :weights, only: %i[show new create edit]
  resources :body_fat, only: %i[show new create edit]
  resources :vitamins, only: %i[index show new create edit destroy]
  resources :recipes, only: %i[index show]
  resources :prescriptions, only: %i[index show new create edit destroy]
end
