# frozen_string_literal: true

class ApplicationController < ActionController::Base

  helper_method :current_cart
    private

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_dashboard_path
    else
      root_path
    end
  end

  def authenticate_admin!
    unless current_user.admin?
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to root_path
    end
  end

  private

  def current_cart
    if session[:cart_id]
      Cart.find_by(id: session[:cart_id])
    else
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
  end

end
