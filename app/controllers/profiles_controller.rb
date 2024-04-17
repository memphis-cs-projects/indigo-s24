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

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      flash[:success] = "Profile updated successfully"
      redirect_to @profile
    else
      flash[:error] = "Failed to update profile"
      render :edit
    end
  rescue StandardError => e
    flash[:error] = "An error occurred: #{e.message}"
    redirect_back(fallback_location: root_path)
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :phone_number, :email, :address)
  end
end
