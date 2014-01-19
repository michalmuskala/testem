class QuizzesController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.includes(questions: :answers).find(params[:id])
  end
end
