class Admin::QuizzesController < Admin::BaseController

  def index
    @quizzes = Quiz.all
  end

  def new
    @quiz = Quiz.new
    @quiz.questions.build.answers.build
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to admin_quiz_path(@quiz), notification: 'Quiz created successfully'
    else
      render 'new'
    end
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

private
  
  def quiz_params
    params.require(:quiz).permit(:name, questions_attributes: [:text, answers_attributes: [:text, :correct]])
  end
end
