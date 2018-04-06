document.addEventListener('turbolinks:load', function() {
  let progressBar = document.querySelector('.progress-bar')

  if (progressBar) {
    let questionNumber = progressBar.dataset.questionNumber
    let questionsCount = progressBar.dataset.questionsCount

    let percentage = ((questionNumber * 100) / questionsCount) + '%'

    progressBar.style.width = percentage;
    progressBar.textContent = percentage;
  }
})
