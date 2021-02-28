class TreatmentRecordsController < ApplicationController
  def new
    @treatmentrecord = TreatmentRecord.new
    @customer = find_customer_by_id
    @reservation = Reservation.find(params[:reservation_id])
  end

  def create
  end



  private
  def treatmentrecord_params
    params.require(:treatmentrecord).permit(
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

end
