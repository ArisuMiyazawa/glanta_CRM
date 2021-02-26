class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @customer = Customer.find(params[:customer_id])
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      redirect_to reservation_path(id: @reservation.id), success: '登録が完了しました'
    else
      flash.now[:danger] = "登録内容に誤りがあります"
      @customer = Customer.find(params[:customer_id])
      render :new
    end
  end

  def show
    @reservation = find_reservation_by_id
    @customer = Customer.find(@reservation.customer_id)
  end

  def index
    @reservations = Reservation.all.search(params[:search])
    @reservations = Reservation.all
  end

  private
  def reservation_params
    params.require(:reservation).permit(:customer_id, :reservation_date, :reservation_time, :note)
  end

  def find_reservation_by_id
    Reservation.find(params[:id])
  end

end
