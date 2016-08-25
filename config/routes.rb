Rails.application.routes.draw do

  devise_for :users

  resources :projects do
    resources :team_members
    resources :teams
    resources :phases do
      resources :experiments
      resources :sprints
    end
  end

  root 'projects#index'

  post 'send_weekly_emails' => 'projects#send_weekly_emails', as: :email_sent

end
