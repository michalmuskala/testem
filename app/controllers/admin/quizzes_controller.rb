class Admin::QuizzesController < Admin::BaseController
  before_action :find_quiz_with_includes, only: [:show, :edit, :update, :destroy]

  def index
    @quizzes = Quiz.all
  end

  def new
    @quiz = Quiz.new
    @quiz.questions.build.answers.build()
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save!
      redirect_to admin_quiz_path(@quiz), notice: 'Quiz created successfully'
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @quiz.update(quiz_params)
      redirect_to admin_quiz_path(@quiz), notice: 'Quiz updated successfully'
    else
      render 'edit'
    end
  end

  def destroy
    @quiz.destroy
    redirect_to admin_quizzes_path, notice: 'Quiz removed'
  end

private

  def find_quiz
    @quiz = Quiz.find(params[:id])
  end

  def find_quiz_with_includes
    @quiz = Quiz.includes(questions: :answers).find(params[:id])
  end
  
  def quiz_params
    params.require(:quiz).permit(:name, questions_attributes: [:id, :text, :_destroy, answers_attributes: [:id, :text, :correct, :_destroy]])
  end
end
