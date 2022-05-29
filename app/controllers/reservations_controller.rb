class ReservationsController < ApplicationController
  def index
    @reservation = Reservation.all
  end

  def new
    @reservation = Reservation.new
    @room = Room.find(params[:room_id])
    @room_id = params[:room_id]
    @user_id = params[:user_id]
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @person_num = params[:person_num]
    @total_day = @end_date.to_date - @start_date.to_date
    @total_amount = @room.price * @person_num.to_i * @total_day.numerator
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :room_id, :user_id, :total_amount))
    if @reservation.save
      flash[:notice] = "ルームを予約しました"
      redirect_to :reservations
    else
      render "new"
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
