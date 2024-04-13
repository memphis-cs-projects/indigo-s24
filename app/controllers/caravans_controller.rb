class CaravansController < ApplicationController

  def show
    @caravan = Caravan.find(params[:id])
    render :show

  end
end
