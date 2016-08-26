class UserMailer < ApplicationMailer

  default from: 'notifications@example.com'

  def sprint_email(user, project, phase, sprints)
    @user = user
    @project = project
    @phase = phase
    @sprints = sprints
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Sprints completing this week, please fill in forms')
  end

end
