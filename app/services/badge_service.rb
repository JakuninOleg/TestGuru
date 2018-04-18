class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @test = @test_passage.test
    @user = @test_passage.user
  end

  def call
    Badge.find_each do |badge|
      case badge.rule
      when '1'
        add_first_attempt_badge if first_attempt(@test.title)
      when '2'
        add_all_tests_by_category(@test.category.name)
      when '3'
        add_levels_badge if tests_passed_level(@test.level)
      end
    end
  end

  private

  def add_first_attempt_badge
    @user.badges << Badge.find_by(rule: 1, parameter: @test.title)
  end

  def add_levels_badge
    @user.badges << Badge.find_by(rule: 3, parameter: @test.level)
  end

  def add_all_tests_by_category(category)
    return unless category == @test.category.name
    correct_tests = TestPassage.correct_passed_tests(@user)
    .pluck('DISTINCT test_id').count
    return unless correct_tests == Category.find_by(name: category).tests.count
    @user.badges << Badge.find_by(rule: 2, parameter: @test.category.name)
  end

  def first_attempt(test_title)
    if @test.title == test_title && @test_passage.passed
      @user.tests.where(title: test_title).count == 1
    end
  end

  def tests_passed_level(level)
    @user.passed_by_level(level).count == Test.by_level(level).count
  end
end
