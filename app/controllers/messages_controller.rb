class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create

    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.new(msg_params)
    @message.sender_id = current_user.id
    if @message.save
    else

    end

  end

  def index

    @messages = Message.where(chat_id: params[:chat_id])
    @messages = Message.where('created_at > ?', params[:created_at_gt])
    @messages.to_json

    render json: @messages


  end

  private
  def msg_params
    params.require(:message).permit(:msg_body, :sender_id, :chat_id)
  end

end
