class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    if UserRoom.where(user_id: current_user.id, room_id: @room.id).present?
      @chats = @room.chats
      @chat = Chat.new
      @user_rooms = @room.user_rooms
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def create
    @room = Room.create
    @join_current_user = UserRoom.create(room_id: @room.id, user_id: current_user.id)
    @join_user = UserRoom.create(join_room_params)
    # ?fields_forの＠user_roomで保存したparamsがなぜ紐づく？
    redirect_to user_room_path(@room.id)
  end
  
  private
  
  def join_room_params
    params.require(:user_room).permit(:user_id, :room_id).merge(room_id: @room.id)
  end
end
