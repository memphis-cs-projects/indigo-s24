class ProfilesController < ApplicationController
  before_action :authenticate_user!

  # Other actions...

  def edit
    @profile = current_user.profile || current_user.build_profile
    # Ensure the @profile object is correctly loaded
  end

  def update
    @profile = current_user.profile || current_user.build_profile

    if current_user.update(email: params[:profile][:email]) && @profile.update(profile_params)
      flash[:success] = "Profile updated successfully"
      redirect_to settings_path
    else
      flash[:error] = "Failed to update profile"
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :phone_number, :address)
  end
end
