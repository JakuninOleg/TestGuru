class QuestionsController < ApplicationController
  before_action :find_test, only: %i[new create]
  before_action :find_question, only: %i[show edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_question_not_found

  def show
    @answers = @question.answers
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question.test
      flash[:notice] = "Вопрос #{@question.body} успешно создан"
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question.test
      flash[:notice] = "Вопрос #{@question.body} успешно обновлён"
    else
      render :edit
    end
  end

  def destroy
    question = Question.destroy(params[:id])
    redirect_to question.test
    flash[:notice] = "Вопрос #{question.body} успешно удалён"
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_from_question_not_found
    render plain: 'Вопрос не найден'
  end
end
