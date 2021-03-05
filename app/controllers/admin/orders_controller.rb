class Admin::OrdersController < ApplicationController
  def index
    @order_details = OrderDetail.all
    if params[:customer_id].blank?
      @orders = Order.all
    else
      @orders = Order.where(customer_id: params[:customer_id])
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_order_path(order)
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end
