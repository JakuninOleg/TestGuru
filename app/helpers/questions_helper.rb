module QuestionsHelper
  def question_header(test)
    if test.questions.last.new_record?
      "Создайте новый вопрос для теста #{test.title}"
    else
      "Редактирование вопроса для теста #{test.title}"
    end
  end
end
