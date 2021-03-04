class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
    @customer = find_customer_by_id
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      redirect_to reservation_path(id: @reservation.id), success: '登録が完了しました'
    else
      flash.now[:danger] = "登録内容に誤りがあります"
      @customer = find_customer_by_id
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

  def edit
    @reservation = find_reservation_by_id
    @customer = find_customer_by_id
  end

  def update
    @reservation = find_reservation_by_id
    @reservation.update(reservation_params)
    redirect_to reservations_path, success: '予約を変更しました'
  end

  private
  def reservation_params
    params.require(:reservation).permit(:customer_id, :reservation_date, :reservation_time, :note)
  end

  def find_reservation_by_id
    Reservation.find(params[:id])
  end

  def find_customer_by_id
    Customer.find(params[:customer_id])
  end
end
