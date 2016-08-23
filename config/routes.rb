Rails.application.routes.draw do
  devise_for :users
  resources :sprints
  resources :experiments
  resources :projects
  resources :phases
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'projects#index'

  post 'send_weekly_emails' => 'projects#send_weekly_emails', as: :email_sent

end
