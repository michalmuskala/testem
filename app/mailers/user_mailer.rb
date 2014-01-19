class UserMailer < ActionMailer::Base
  default from: "noreply@testem.herokuapp.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.solution.subject
  #
  def solution(solution)
    @solution = solution
    @url = solution_url(@solution)
    @quiz = solution.quiz_version
    @user = @solution.user

    mail(to: @user.email, subject: @quiz.name)
  end
end
