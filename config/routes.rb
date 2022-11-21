Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :dashboards, only: %i[index]
  resources :goals, only: %i[index new create destroy]
  resources :weights, only: %i[index show new create]
  resources :body_fats, only: %i[index show new create]
  resources :vitamins, only: %i[index show new create edit update destroy]
  resources :recipes, only: %i[index show]
  # get '/recipes/:recipe', to: 'recipes#show', as: 'recipe'
  resources :prescriptions, only: %i[index show new create edit update destroy]
  get "my_goals", to: "goals#my_goals"
  patch "goals/:id/set_as_done", to: "goals#set_as_done", as: :done
end
