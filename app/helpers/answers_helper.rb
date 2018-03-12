module AnswersHelper
  def answer_header(answer)
    if answer.new_record?
      "Создайте новый ответ для вопроса #{answer.question.body}"
    else
      "Редактирование ответа на вопрос #{answer.question.body}"
    end
  end
end
