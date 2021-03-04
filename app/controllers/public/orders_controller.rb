class Public::OrdersController < ApplicationController
  def new
    @customer = Customer.find(current_customer.id)
  end

  def confirm
    @order = Order.new
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @payment_method = params[:payment_method]
    case params[:send_address_select]
      when "0" then
        @send_address_postalcode = current_customer.postal_code
        @send_address_address = current_customer.address
        @send_address_name = current_customer.last_name + ' ' +
                             current_customer.first_name
      when "1" then
        @send_address_postalcode = Address.find(params[:addressID]).postal_code
        @send_address_address = Address.find(params[:addressID]).address
        @send_address_name = Address.find(params[:addressID]).name
      else
        @send_address_postalcode = params[:new_postal_code]
        @send_address_address = params[:new_address]
        @send_address_name = params[:new_name]
    end
  end

  def create
    order = Order.new(order_params)
    order.save
    cart_items = CartItem.where(customer_id: current_customer.id)
    cart_items.each do |item|
      order_detail = OrderDetail.new
      order_detail.order_id = order.id
      order_detail.item_id = item.item.id
      order_detail.price = item.item.price
      order_detail.amount = item.amount
      order_detail.save!
    end
    CartItem.where(customer_id: current_customer.id).delete_all
    redirect_to orders_complete_path
  end

  def complete
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
