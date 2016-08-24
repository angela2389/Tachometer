Rails.application.routes.draw do
  devise_for :users
 
  get 'projects/:id/phases/new' => 'phases#new', as: :new_phase_in_project

  resources :projects do
    resources :phases do
      resources :experiments do
	    resources :sprints
	  end
    end
  end
 
  root 'projects#index'

  post 'send_weekly_emails' => 'projects#send_weekly_emails', as: :email_sent

end
