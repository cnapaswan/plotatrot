
document.querySelector('.show-hid').addEventListener('click', show)

function show(){
  var forms = document.querySelector('.hidden-form')
  forms.classList.remove('hidden-form')
}