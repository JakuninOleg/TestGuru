class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @test = @test_passage.test
    @user = @test_passage.user
  end

  def call
    return unless @test_passage.test_passed?
    add_first_attempt_badge if first_attempt
    add_all_tests_by_category(@test_passage.test.category.name)
    add_levels_badge(@test_passage.test.level) if tests_passed_level(@test_passage.test.level)
  end

  private

  def add_first_attempt_badge
    @user.badges << Badge.find_by(rule: 'Первая попытка')
  end

  def add_levels_badge(level)
    @user.badges << Badge.find_by(rule: "Все тесты уровня #{level}")
  end

  def add_all_tests_by_category(category)
    return unless category == @test_passage.test.category.name
    correct_tests = TestPassage.correct_passed_tests(@user)
                                  .pluck('DISTINCT test_id')
                                  .count
    return unless correct_tests == Category.find_by(name: category).tests.count
    @user.badges << Badge.find_by(rule: "Все тесты категории #{category}")
  end

  def first_attempt
    @user.tests.where(id: @test.id).size <= 1
  end

  def tests_passed_level(level)
    TestPassage.passed_by_level(@user, level).count == Test.by_level(level).count
  end
end
