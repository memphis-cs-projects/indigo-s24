class OrdersController < ApplicationController
  def index
    # Implement the logic to fetch and display the user's orders
  end

  def new
    @order = Order.new
    @cart = current_cart
    @profile = current_user.profile || current_user.build_profile
  end

  def create
    @order = current_user.orders.build(order_params)

    ActiveRecord::Base.transaction do
      @order.total_price = current_cart.total_cost

      # Copy the items from the cart to the order
      current_cart.cart_items.each do |cart_item|
        @order.order_items.build(product: cart_item.product, quantity: cart_item.quantity, price: cart_item.price)
      end

      if @order.save
        # Handle payment processing and finalize order here
        # ...
        current_cart.clear

        redirect_to root_path, notice: 'Thank you for your order.'
      else
        render :new
      end
    end
  rescue ActiveRecord::RecordInvalid => e
    # If something goes wrong, handle the error
    flash.now[:alert] = "There was a problem with your order."
    render :new
  end

  def order_params
    params.require(:order).permit(:total_price, :status, profile_attributes: [:name, :address, :email, :phone_number])
  end

end
