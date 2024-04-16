class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart
    @cart_items = @cart&.cart_items || []
  end

  def add_item
    current_cart.add_item(caravan_id: params[:caravan_id])
    if current_cart.save
      redirect_to cart_path, notice: 'Item added to cart'
    else
      redirect_to caravans_path, alert: 'Could not add item to cart.'
    end
  end

end
