class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to "#", success: 'ご記入ありがとうございました'
    else
      flash.now[:danger] = "ご記入内容に誤りがあります"
      render :new
    end
  end

  def consent_form
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :name_kana, :birthday, :job, :postcode, :street_address, :phone_number, :email, :line_id, :allergy, :introducer_id, :request, :agreement)
  end
end
