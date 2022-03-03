class ChatsController < ApplicationController

  def new
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.user_ids = @chat.user_ids << current_user.id
    if @chat.save
      flash[:sucesso] = "Você criou um novo chat"
      redirect_to request.referer
    else
      flash[:l_errado] = "Algo está errado, verifique se o nome do chat não está vazio."
      redirect_to request.referer
    end
  end

  def request_chat
    @chats = Chat.all
    @chats.created_at_gt


  end

private
  def chat_params
    params.require(:chat).permit(:chat_name, user_ids:[])
  end



end
