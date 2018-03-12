module TestsHelper
  def test_header(test)
    if test.new_record?
      "Создайте новый тест"
    else
      "Редактирование теста #{test.title}"
    end
  end
end
