class SolutionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @quiz = Quiz.includes(questions: :answers, quiz_versions: {}).find(params[:quiz_id]).current_version
  end

  def create
    @quiz_version = QuizVersion.find(solution_params[:id])
    @solution = @quiz_version.solutions.build(answers: solution_params[:questions].to_hash, user: current_user)
    if @solution.save
      redirect_to @solution
    else
      render 'new'
    end
  end

  def show
    @solution = current_user.solutions.find(params[:id])
  end

  def index
    @solutions = current_user.solutions.includes(:quiz_version).all
  end

private

  def solution_params
    params.require(:quiz_version).permit(:id, questions: [answers: [:response]])
  end
end