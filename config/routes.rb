Rails.application.routes.draw do

  devise_for :users

  get '/projects/:project_id/phases/:phase_id/sprints/:id/finalize' => 'sprints#finalize', as: :sprint_finalize

  resources :projects do
    resources :phases do
      resources :experiments
      resources :sprints
    end
  end

  root 'projects#index'

  post 'send_weekly_emails' => 'projects#send_weekly_emails', as: :email_sent

end
