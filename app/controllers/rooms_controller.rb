class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_q
  
  def index
    @rooms = Room.all
  end

  def posts
    @rooms = current_user.rooms.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = "ルームを新規登録しました"
      redirect_to :rooms
    else
      flash[:notice] = "ルームの登録に失敗しました"
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def search
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end


  private

  def room_params
    params.require(:room).permit(:name, :content, :price, :address, :image).merge(user_id: current_user.id)
  end

  def set_q
    @q = Room.ransack(params[:q])
  end 
end
