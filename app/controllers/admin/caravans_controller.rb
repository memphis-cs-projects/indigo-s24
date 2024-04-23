module Admin
  class CaravansController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_caravan, only: [:show, :edit, :update, :destroy]

    def new
      @caravan = Caravan.new
    end

    def index
      @caravans = Caravan.all
    end

    def create
      @caravan = Caravan.new(caravan_params)
      if @caravan.save
        redirect_to admin_manage_listings_path, notice: 'Caravan created successfully.'
      else
        render :new
      end
    end

    def set_caravan
      @caravan = Caravan.find(params[:id])
    end



    # Define other actions such as edit, update, destroy as needed

    private

    def caravan_params
      params.require(:caravan).permit(:name, :size, :adventure, :exterior_color, :interior_theme, :price, :image)
    end

    def authenticate_admin!
      # Define logic to verify if current_user is an admin
    end
  end
end
