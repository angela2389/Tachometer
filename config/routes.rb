Rails.application.routes.draw do
  devise_for :users
  resources :experiments
  resources :projects
end
