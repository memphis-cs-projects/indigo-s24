class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:edit, :update]

  def edit
  end

  def update
    if @profile.update(profile_params)
      flash[:success] = "Profile updated successfully"
      redirect_to settings_path
    else
      render :edit
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:name, :phone_number, :email, :address)
  end
end
