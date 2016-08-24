Rails.application.routes.draw do
  devise_for :users
  resources :experiments
  get 'projects/:id/phases/new' => 'phases#new', as: :new_phase_in_project
  get 'projects/:project_id/phases/:phase_id/sprints/new' => 'sprints#new', as: :new_sprint_in_phase
  get 'projects/:project_id/phases/:phase_id/sprints/' => 'sprints#index', as: :sprints
  get 'projects/:project_id/phases/:phase_id/sprints/:id/edit' => 'sprints#edit', as: :edit_sprint
  get 'projects/:project_id/phases/:phase_id/sprints/:id' => 'sprints#show', as: :sprint


  resources :projects do
    resources :phases do
      resources :sprints
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'projects#index'

  post 'send_weekly_emails' => 'projects#send_weekly_emails', as: :email_sent

end
