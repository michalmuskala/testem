class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.solution.subject
  #
  def solution
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
