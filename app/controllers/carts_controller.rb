class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart

  def show
    @cart = current_user.cart
    @cart_items = @cart&.cart_items || []
  end

  def add_item
    #current_cart.add_item(caravan_id: params[:caravan_id])
    caravan = Caravan.find_by(id: params[:caravan_id])
    current_user.cart.add_caravan(caravan)
    if current_user.cart.save
      redirect_to cart_path, notice: 'Item added to cart.'
    else
      redirect_to caravans_path, alert: 'Could not add item to cart.'
    end
  end


  private

def set_cart
  @cart = current_user.cart
end



end
