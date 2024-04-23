class CaravansController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
  #before_action :set_caravan, only: [:show, :edit, :update, :destroy]

  def show
    @caravan = Caravan.find(params[:id])
    render :show

  end

  def index
    @caravans = Caravan.all
  end

  def new
    @caravan = Caravan.new
  end

  def create
    @caravan = Caravan.new(caravan_params)
    if @caravan.save
      redirect_to admin_manage_listings_path, notice: 'Caravan was successfully create'.
    else
      render :new
    end
  end

  def expiry_date
  end

  def update

  end

  def set_caravan
    @caravan = Caravan.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Caravan not found."
    redirect_to caravans_path
  end

  def caravan_params
    params.require(:caravan).permit(:size, :adventure, :color, :theme, :price)
  end


end
