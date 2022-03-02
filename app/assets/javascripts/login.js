var asteriscooos = '';

function mostrarsenha(index, senha_Var)
{


  if(index == 0)
  {
    var txt = document.getElementById('asterisco');
    asteriscooos = txt.innerText;
    txt.innerText = senha_Var;
    document.getElementById('botao').name = 1;
    document.getElementById('botao').value = "Esconder Senha";


  }else{
    var txt = document.getElementById('asterisco');
    txt.innerText = asteriscooos;
    document.getElementById('botao').name = 0;
    document.getElementById('botao').value = "Mostrar Senha";

  }


}
