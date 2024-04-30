

class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.includes(order_items: :caravan)
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
      @order.total_price = current_user.cart.total_cost

      current_cart.cart_items.each do |cart_item|
        @order.order_items.build(caravan: cart_item.caravan, quantity: cart_item.quantity, price: cart_item.price)
      end

      if @order.save
        # Copy the cart items to the order and then clear the cart
        current_user.cart.cart_items.each do |cart_item|
          @order.order_items.create(caravan: cart_item.caravan, quantity: cart_item.quantity, price: cart_item.price)
        end
        current_user.cart.cart_items.destroy_all

        redirect_to orders_path, notice: 'Thank you for your order.'
      else
        render :new
      end
    end

  rescue ActiveRecord::RecordInvalid => e
    flash.now[:alert] = "There was a problem with your order."
    render :new
  end

  private

  def order_params
    params.require(:order).permit(:status, order_items_attributes: [:caravan_id, :quantity, :price])
  end
end
