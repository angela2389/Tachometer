Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get '/projects/:project_id/phases/:phase_id/sprints/:id/start_sprint' => 'sprints#start_sprint', as: :sprint_start
  get '/projects/:project_id/phases/:phase_id/sprints/:id/end_sprint' => 'sprints#end_sprint', as: :sprint_end

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
