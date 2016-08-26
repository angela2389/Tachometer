module SprintEmail extend ActiveSupport::Concern

  private

  def run_mailer(phase)
    mailer_hash = phase.get_mailer_for_current_phase
    users = mailer_hash[:users]
    sprints = mailer_hash[:sprints]
    project = Project.find(phase.project.id)
    users.each do |user|
      UserMailer.sprint_email(user, project, phase, sprints).deliver_now
    end
  end

end
