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
end
