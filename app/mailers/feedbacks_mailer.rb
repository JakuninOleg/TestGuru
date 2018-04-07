class FeedbacksMailer < ApplicationMailer
  before_action :find_admin

  def feedback(feedback)
    @feedback = feedback

    mail to: @admin.email, from: @feedback.user.email, subject: 'Фидбэк площадки TestGuru'
  end

  private

  def find_admin
    @admin = User.find_by(type: 'Admin')
  end
end
