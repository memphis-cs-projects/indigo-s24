class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:joined_group_id]}"
  end
end
