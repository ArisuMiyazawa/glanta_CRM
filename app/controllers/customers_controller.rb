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
    @customer.update(customer_params)
    redirect_to customer_path(id: @customer.id)
  end

  def index
    @customer = Customer.order :name_kana
  end

  def show
    @customer = find_customer_by_id
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :name_kana, :birthday, :job, :postcode, :street_address, :phone_number, :email, :line_id, :allergy, :introducer_name, :request, :consent, :nail_technician_note)
  end

  def find_customer_by_id
    Customer.find(params[:id])
  end

  #def birthday_join
    #date = params[:user][:birthday]

    #if date["birthday(1i)"].empty? && date["birthday(2i)"].empty? && date["birthday(3i)"].empty?
      #return
    #end

    #Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i

  #end
end
