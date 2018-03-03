class TestsController < ApplicationController
  def index
    @tests = Test.all
    # render plain: @tests.pluck
  end

  def show
    @test = Test.find(params[:id])
  end
end
