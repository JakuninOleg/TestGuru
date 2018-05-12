class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: %i[show update result gist]

  def show
  end

  def result
  end

  def update
    if @test_passage.completed? && !@test_passage.time_over?
      @test_passage.accept!(params[:answer_ids])
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      @test_passage.terminate!
      redirect_to tests_path
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    flash_options = if result
      gist_create!(result.html_url)
      { notice: t('.success', url: result.html_url) }
    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def gist_create!(url)
    current_user.gists.create!(question: @test_passage.current_question, url: url)
  end
end
