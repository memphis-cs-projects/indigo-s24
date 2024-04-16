class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
    render :new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to settings_path, notice: 'Successfully added'
    else
      render :new
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :phone_number, :email)
  end
end
