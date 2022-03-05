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
    @messages = Message.where('created_at > ?', params[:created_at_gt]).where.not(sender_id: current_user.id)
    @messages.to_json
    render json: @messages.to_json(include: :user)

  end

  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy

    redirect_to request.referer
  end


private
  def chat_params
    params.require(:chat).permit(:chat_name, user_ids:[])
  end



end
