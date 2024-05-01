class SettingsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.profile
      redirect_to edit_profile_path(current_user.profile)
    else
      redirect_to new_profile_path
    end
  end

  def profiles
    @profiles = Profile.order(:name, :phone_number, :email, :address)
    render :profiles
  end

  def payments
    # Your logic for the payments action goes here
  end
end
