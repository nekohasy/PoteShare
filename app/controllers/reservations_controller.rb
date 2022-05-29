class ReservationsController < ApplicationController
  def index
  end

  def new
    @reservation = Reservation.new
    @room = Room.find(params[:room_id])
    @room_id = params[:room_id]
    @user_id = params[:user_id]
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @person_num = params[:person_num]
    @reservation.total_day = @end_date.to_date - @start_date.to_date
    @total_amount = @room.price * @person_num.to_i * @reservation.total_day
  end

  def create
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
