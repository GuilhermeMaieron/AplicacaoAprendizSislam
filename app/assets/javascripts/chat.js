var valor = '';
var lim = 0;
var search_messages = setInterval(busca_mensagem, 1000)

function busca_mensagem() {
$.ajax({
  type: "GET",
  url: "/chats/request_chat",
  data: {created_at_gt: dat.getAttribute('data-ultima-msg')}

}).done(function(data) {



  var today = new Date();
  var time = today.getTime();
  dat.setAttribute('created_at_gt', time)

  for(i = 0; i<data.length; i++)
  {
    $(dat).append("muahaha")

  }
});
}


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

function botao_users_user(menu)
{
    var memu = document.getElementById(menu);
    if(memu.style.display == "none")
    {
      memu.style.display = "block";

    }else{

      memu.style.display = "none";
    }

}
