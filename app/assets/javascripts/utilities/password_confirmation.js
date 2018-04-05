document.addEventListener('turbolinks:load', function() {
  let passwordConfirmation = document.querySelector('#user_password_confirmation');

  if (passwordConfirmation) {
    passwordConfirmation.addEventListener('input', equalPasswordConfirmation);
  };
})

function equalPasswordConfirmation() {
  let password = document.querySelector('#user_password');
  let passwordConfirmation = document.querySelector('#user_password_confirmation');

  if (passwordConfirmation.value == '') {
    password.classList.remove('border-success');
    passwordConfirmation.classList.remove('border-success');
    password.classList.remove('border-danger');
    passwordConfirmation.classList.remove('border-danger');
  } else if (password.value == passwordConfirmation.value) {
    password.classList.add('border-success');
    passwordConfirmation.classList.add('border-success');
    password.classList.remove('border-danger');
    passwordConfirmation.classList.remove('border-danger');
  } else {
    password.classList.add('border-danger');
    passwordConfirmation.classList.add('border-danger');
    password.classList.remove('border-success');
    passwordConfirmation.classList.remove('border-success');
  }
}
