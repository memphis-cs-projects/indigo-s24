class CaravansController < ApplicationController
  before_action :authenticate_user!

  def show
    @caravan = Caravan.find(params[:id])
    render :show

  end
end
