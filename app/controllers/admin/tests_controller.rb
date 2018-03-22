class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[show start edit update]

  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def create
    @test = Test.new(test_params)
    @test.admin = current_user
    if @test.save
      redirect_to admin_tests_path, notice: "Тест #{@test.title} успешно создан"
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path, notice: "Тест #{@test.title} успешно обновлён"
    else
      render :edit
    end
  end

  def destroy
    test = Test.destroy(params[:id])
    redirect_to admin_tests_path, notice: "Тест #{test.title} успешно удалён"
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :admin)
  end
end
