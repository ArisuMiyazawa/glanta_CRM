class GuestReservationsController < ApplicationController
  def new
    @guest_reservation = GuestReservation.new
  end

  def create
    @guest_reservation = GuestReservation.new(guest_reservation_params)
    if @guest_reservation.save
      redirect_to "#", success: '登録が完了しました'
    else
      flash.now[:danger] = '登録に失敗しました'
      render :new
    end
  end

  private
  def guest_reservation_params
    params.require(:guest_reservation).permit(:customer_id, :name_kana, :phone_number, :reservation_date, :reservation_time, :introducer_id)
  end
end
