module SprintEmail extend ActiveSupport::Concern

  private

  def run_mailer(user)
    UserMailer.welcome_email(user).deliver_now
  end

end
