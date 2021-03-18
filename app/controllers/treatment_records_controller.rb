class TreatmentRecordsController < ApplicationController
  def new
    @treatment_record = TreatmentRecord.new
    @customer = find_customer_by_id
    @reservation = find_reservation_by_id
  end

  def create
    @treatment_record = TreatmentRecord.new(treatment_record_params)
    if @treatment_record.save
      redirect_to treatment_record_path(id: @treatment_record.id), success: 'カルテ登録が完了しました'
    else
      flash.now[:danger] = "記入内容に誤りがあります"
      render :new
    end
  end

  def show
    @treatment_record = TreatmentRecord.find(params[:id])
    @customer = Customer.find(@treatment_record.customer_id)
    @reservation = Reservation.find(@treatment_record.reservation_id)
  end

  def edit
    @treatment_record = TreatmentRecord.find(params[:id])
  end

  def update
    @treatment_record = TreatmentRecord.find(params[:id])
    @treatment_record.update(treatment_record_params)
    redirect_to treatment_record_path(id: @treatment_record.id), success: 'カルテ内容を変更しました'
  end

  def index
    @customer = find_customer_by_id
    @reservations = Reservation.where(customer_id: @customer.id).order(reservation_date: :desc)
  end

  def empty_page
    @customer = find_customer_by_id
    @reservation = find_reservation_by_id
  end

  private
  def treatment_record_params
    params.require(:treatment_record).permit(
      :customer_id,
      :reservation_id,
      :gel_used,
      :amount_of_money,
      :treatment_menu,
      :remaining_number_of_pointcards,
      :remaining_number_of_stones,
      :other
    )
  end

  def find_customer_by_id
    Customer.find(params[:customer_id])
  end

  def find_reservation_by_id
    Reservation.find(params[:reservation_id])
  end

end
