class ReservationsController < ApplicationController
  def new
    @customer = find_customer_by_id
    @reservations = Reservation.all
  end

  def new_timeselect
    @reservation = Reservation.new(reservation_date: params[:reservation_date])
    @customer = find_customer_by_id
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservation_path(id: @reservation.id), success: '登録が完了しました'
    else
      @customer = Customer.find(params[:reservation][:customer_id])
      render :new_timeselect
    end
  end

  def show
    @reservation = find_reservation_by_id
    @customer = Customer.find(@reservation.customer_id)
  end

  def index
    @reservations = Reservation.all
  end

  def edit
    @reservations = Reservation.all
    @reservation = find_reservation_by_id
    @customer = find_customer_by_id
  end

  def edit_timeselect
    @customer = find_customer_by_id
    @reservation = find_reservation_by_id
    @reservation_date = params[:reservation_date]
  end

  def update
    @reservation = find_reservation_by_id
    if @reservation.update(reservation_params)
       redirect_to reservations_path, success: '予約を変更しました'
    else
      @customer = Customer.find(params[:reservation][:customer_id])
      @reservation_date = params[:reservation_date]
      render :edit_timeselect
    end

  end

  def destroy
    @reservation = find_reservation_by_id
    @reservation.destroy
    redirect_to reservations_path, success: '予約を取り消しました'
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
