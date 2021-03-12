class CustomersController < ApplicationController
  def guest
    @customer = Customer.new
    @customer.reservations.build
  end

  def guest_create
    @customer = Customer.new(guest_input_paramas)
    @customer.guest_account = true
    if @customer.save
      redirect_to reservation_path(id: @customer.id), success: '登録が完了しました'
    else
      flash.now[:danger] = "ご記入内容に誤りがあります"
      render :guest
    end

  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_input_params)

    if @customer.save
      redirect_to customer_path(id: @customer.id), success: 'ご記入ありがとうございました'
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
    @customer.update(customer_input_params)
    redirect_to customer_path(id: @customer.id), success: '登録内容を変更しました'
  end

  def index
    @customer = Customer.order :name_kana
  end

  def show
    @customer = find_customer_by_id
  end

  private
  def customer_input_params
    params.require(:customer).permit(
      :name,
      :name_kana,
      :birthday,
      :job,
      :postcode,
      :street_address,
      :phone_number,
      :email,
      :line_id,
      :allergy,
      :introducer_name,
      :request,
      :consent,
      :nail_technician_note,
      reservations_attributes: [:reservation_date, :reservation_time, :note]
    )
  end

  def guest_input_paramas
    params.require(:customer).permit(
      :name_kana,
      :phone_number,
      :introducer_name,
      reservations_attributes: [:reservation_date, :reservation_time, :note]
    )
  end

  def find_customer_by_id
    Customer.find(params[:id])
  end
end
