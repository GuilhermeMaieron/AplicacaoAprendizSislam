class ChatsController < ApplicationController

  def new
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      flash[:sucesso] = "Você criou um novo chat"
      redirect_to request.referer
    else
      render 'new'
    end
  end



private
  def chat_params
    params.require(:chat).permit(:chat_name, user_ids:[])
  end



end
