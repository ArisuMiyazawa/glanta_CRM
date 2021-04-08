class CustomersController < ApplicationController

  def guest
    @customer = Customer.new
    @reservations = @customer.reservations.build
  end

  def guest_create
    @customer = Customer.new(guest_input_params)
    @customer.guest_account = true

    if @customer.save
      redirect_to reservation_path(id: @customer.latest_reservations_id), success: '登録が完了しました'
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
    render layout: false
  end

  def edit
    @customer = find_customer_by_id
  end

  def update
    @customer = find_customer_by_id
    if @customer.update(customer_input_params)
      redirect_to customer_path(id: @customer.id), success: '登録内容を変更しました'
    else
      flash.now[:danger] = "ご記入内容に誤りがあります"
      render :new
    end
  end

  def index
    @customer = Customer.paginate(page: params[:page], per_page: 20).order(name_kana: :asc).search(params[:search])
  end

  def desc_index
    @customer = Customer.paginate(page: params[:page], per_page: 20).order(name_kana: :desc).search(params[:search])
  end

  def show
    @customer = find_customer_by_id
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_path(id: @customer.id), success: 'お客様情報を削除しました'
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

  def guest_input_params
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
