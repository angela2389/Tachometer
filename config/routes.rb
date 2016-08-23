Rails.application.routes.draw do
  devise_for :users
  resources :sprints
  resources :experiments
  resources :projects
end
