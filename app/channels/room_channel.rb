class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params[:dialog_id]}"
  end
end
