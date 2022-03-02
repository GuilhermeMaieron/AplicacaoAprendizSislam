var valor = '';
var lim = 0;

function botao_users(menu)
{
  var valord = menu;

  if(lim < 1)
  {
    valor = menu;
    lim++;

  }

  if(valord == valor)
  {
    var memu = document.getElementById(menu);
    if(memu.style.display == "none")
    {
      memu.style.display = "block";

    }else{

      memu.style.display = "none";
    }

  }else {
    var memu = document.getElementById(valor);
    memu.style.display = "none";
    memu = document.getElementById(menu);
    memu.style.display = "block";
    valor = menu;
  }



}
