module SprintEmail extend ActiveSupport::Concern

  private

  def run_mailer(project)
    mailer_hash = project.get_mailer_for_current_phase
    users = mailer_hash[:users]
    sprints = mailer_hash[:sprints]
    users.each do |user|
      UserMailer.sprint_email(user, project, sprints).deliver_now
    end
  end

end
