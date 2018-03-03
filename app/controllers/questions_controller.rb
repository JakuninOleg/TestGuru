class QuestionsController < ApplicationController
  before_action :find_test, only: :new

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_question_not_found

  def show
    # @question = Question.find_by(id: params[:id], test_id: params[:test_id])
    @question = Question.find(params[:id])
  end

  def new
  end

  def create
    question = Question.create(body: question_params[:body], test_id: params[:test_id])
    if question.save
      redirect_to test_path(question.test)
    else
      render :new
    end
  end

  def destroy
    question = Question.destroy(params[:id])
    redirect_to test_path(question.test)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_from_question_not_found
    render plain: 'Вопрос не найден'
  end
end
