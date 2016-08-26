Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get '/projects/:project_id/phases/:phase_id/sprints/:id/finalize' => 'sprints#finalize', as: :sprint_finalize

  resources :projects do
    resources :team_members
    resources :teams
    resources :phases do
      resources :experiments
      resources :sprints
    end
  end

  root 'projects#index'

  post 'send_emails' => 'phases#send_emails', as: :send_emails

end
