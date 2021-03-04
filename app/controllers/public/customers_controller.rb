class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer.id)
  end

  def inactive
  end

  def disable
    customer = Customer.find(current_customer.id)
    customer.is_deleted = TRUE
    customer.update
    redirect_to destroy_customer_session_path
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    customer = Customer.find(current_customer.id)
    customer.update(customer_params)
    redirect_to customers_mypage_path
  end

  private
  def customer_params
    params.require(:customer).permit(:email,
                                     :last_name,
                                     :first_name,
                                     :last_name_kana,
                                     :first_name_kana,
                                     :postal_code,
                                     :address,
                                     :telephone_number,
                                     :is_deleted)
  end
end
