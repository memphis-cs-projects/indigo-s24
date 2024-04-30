class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: [:create]

  #def create
    #@cart = current_user.cart || current_user.create_cart
    #@cart_item = @cart.cart_items.new(caravan_id: params[:caravan_id], quantity: 1) # example attributes

    #if @cart_item.save
      #flash[:notice] = 'Item added to cart.'
      #redirect_to cart_path
    #else
     # flash[:alert] = 'There was a problem adding the item to the cart.'
      #redirect_back(fallback_location: root_path)
    #end
  #end

  def create
    @cart = current_user.cart || current_user.create_cart
    existing_item = @cart.cart_items.find_by(caravan_id: params[:caravan_id])

    if existing_item
      existing_item.quantity += 1
      @cart_item = existing_item
    else
      @cart_item = @cart.cart_items.new(caravan_id: params[:caravan_id], quantity: 1)
    end

    if @cart_item.save
      flash[:notice] = 'Item added to cart.'
      redirect_to cart_path
    else
      flash[:alert] = 'There was a problem adding the item to the cart.'
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @cart_item = CartItem.find(params[:id])
  end

  def update
    # Logic for updating an item in the cart
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      flash[:notice] = 'Item quantity updated.'
      redirect_to cart_path
    else
      flash[:alert] = 'Could not update item quantity.'
      redirect_to cart_path
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path, notice: 'Item was successfully removed.'
  end

  private

  def set_cart
    @cart = current_user.cart || current_user.create_cart
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
    #params.permit(:caravan_id) # Adjust the permitted parameters to match your cart items attributes
  end

end
