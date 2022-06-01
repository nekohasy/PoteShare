class ReservationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @reservations = current_user.reservations.all.order(:start_date)
  end

  def new
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:reservation][:room_id])
    @reservation.user_id = current_user.id
    if @reservation.valid?
      @reservation.total_day = @reservation.total_day_calc.to_i
      @reservation.total_amount = @room.price * @reservation.person_num * @reservation.total_day
    else
      render 'rooms/show'
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:reservation][:room_id])
    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render 'rooms/show'
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :person_num, :total_day, :total_amount, :user_id, :room_id)
  end
end
