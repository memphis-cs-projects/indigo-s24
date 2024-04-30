# app/controllers/orders_controller.rb

class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.includes(:caravans)
  end

  def new
    @order = Order.new
    @cart = current_cart
    @profile = current_user.profile || current_user.build_profile
  end

  def create
    @order = current_user.orders.build(order_params)
    @order.status = "Your order will be delivered in 10 days."

    ActiveRecord::Base.transaction do
      @order.total_price = current_cart.total_cost

      # Copy the items from the cart to the order
      current_cart.cart_items.each do |cart_item|
        @order.order_items.build(caravan: cart_item.caravan, quantity: cart_item.quantity, price: cart_item.price)
      end

      if @order.save
        # Handle payment processing and finalize order here
        # ...
        current_cart.clear

        redirect_to orders_path, notice: 'Thank you for your order.'
      else
        render :new
      end
    end
  rescue ActiveRecord::RecordInvalid => e
    # If something goes wrong, handle the error
    flash.now[:alert] = "There was a problem with your order."
    render :new
  end

  private

  def order_params
    params.require(:order).permit(:status, order_items_attributes: [:caravan_id, :quantity, :price])
  end
end
