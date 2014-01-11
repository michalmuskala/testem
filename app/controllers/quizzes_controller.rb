class QuizzesController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end
end
