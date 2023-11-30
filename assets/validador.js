function validador(listaCampos) {
  if(listaCampos.length == 0){
    return true
  }

  let valid = true

  listaCampos.reverse().forEach((input) => {
    let input_type = input.constructor.name

    if((input_type == "HTMLInputElement" || input_type == "HTMLTextAreaElement") && input.getAttribute('type') != "checkbox"){
      if (input.value == "") {
        let label = document.querySelector(`[for=${input.id}]`)
        document.cadastro.status.value = `Preencha o campo ${label.innerHTML}`
        valid = false
      }
    } else if (input_type == "RadioNodeList"){
      let some_checked = false
      input.forEach(option => {
        if(option.checked){
          some_checked = true
        }
      })

      if(!some_checked){
        let label = document.querySelector(`[for=${input[0].name}]`)
        document.cadastro.status.value = `Preencha o campo ${label.innerHTML}`
        valid = false
      }
    }
  });

  if (valid) {
    document.cadastro.status.value = ""
  }

  return valid
}
