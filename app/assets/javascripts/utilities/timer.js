document.addEventListener('turbolinks:load', function() {
  let timer = document.querySelector('.timer')

  if (timer) {
    let timeLeft = timer.dataset.timer

    setInterval(function() {
      if (timeLeft > 0) {
        timeLeft -= 1
      } else {
        alert('Время вышло!')
        document.querySelector('form').submit()
      }

      resultTime = parseInt(timeLeft / 60) + ':' + timeLeft % 60
      timer.innerHTML = resultTime
    }, 1000)
  }
})
