Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :dashboards, only: %i[index]
  resources :goals, only: %i[index show new edit destroy]
  resources :weights, only: %i[show new edit]
  resources :body_fat, only: %i[index show new edit]
  resources :vitamins, only: %i[index show new edit destroy]
  resources :recipes, only: %i[index show]
  resources :prescriptions, only: %i[index show new edit destroy]
end
