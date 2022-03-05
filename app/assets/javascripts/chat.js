var valor = '';
var lim = 0;

var search_messages = setInterval(busca_mensagem, 3000);

function busca_mensagem() {
  var divglobal = document.getElementById("div-global")
$.ajax({
  type: "GET",
  url: "/chats/request_chat",
  data: {created_at_gt: divglobal.getAttribute('data-ultima-msg')}

}).done(function(data) {
  var today = new Date();
  var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
  var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
  var dateTime = date+' '+time;

  for(i = 0; i< data.length; i++)
  {
    var dat = document.getElementById("divmsg"+data[i].chat_id);
    $(dat).append("<p class='msgDeles'>"+data[i].user.username+':'+"<br>"+data[i].msg_body+ "</p>");

  }
  divglobal.setAttribute('data-ultima-msg', dateTime);

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
