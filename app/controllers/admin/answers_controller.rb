class Admin::AnswersController < Admin::BaseController
  before_action :find_question, only: %i[new create]
  before_action :find_answer, only: %i[edit update destroy]

  def new
    @answer = @question.answers.build
  end

  def edit
  end

  def create
    @answer = @question.answers.build(answer_params)

    if @answer.save
      redirect_to [:admin, @question]
    else
      render :new
    end
  end

  def update
    @question = @answer.question

    if @answer.update(answer_params)
      redirect_to [:admin, @question]
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to [:admin, @answer.question]
  end

  private

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
