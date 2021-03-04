class Public::OrdersController < ApplicationController
  def new
    @customer = Customer.find(current_customer.id)
  end

  def confirm
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @payment_method = params[:payment_method]
    case params[:send_address_select]
      when 0 then

      when 1 then

      else

    end
  end

  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id

  end

  private
  def order_params
    params.require(:order).permit(:id,
                                  :customer_id,
                                  :postal_code,
                                  :address,
                                  :name,
                                  :shipping_cost,
                                  :total_payment,
                                  :payment_method,
                                  :status)
  end
end
