class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
      if @customer.email == ""
        @customer.email = nil
      end

    if @customer.save
      redirect_to root_path, success: 'ご記入ありがとうございました'
    else
      flash.now[:danger] = "ご記入内容に誤りがあります"
      render :new
    end
  end

  def consent_form
  end

  def edit
    @customer = find_customer_by_id
  end

  def update
    @customer = find_customer_by_id
    @customer.update(customer_params)
    redirect_to "#"
  end

  def index
    @customer = Customer.order :name_kana
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :name_kana, :birthday, :job, :postcode, :street_address, :phone_number, :email, :line_id, :allergy, :introducer_name, :request, :consent, :nail_technician_note)
  end

  def find_customer_by_id
    Customer.find(params[:customer_id])
  end
end
