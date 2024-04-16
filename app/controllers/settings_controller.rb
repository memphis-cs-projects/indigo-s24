class SettingsController < ApplicationController
  def profiles
   @profiles = Profile.order(:name, :phone_number, :email)
    render :profiles
  end

  def payments
    # Your logic for the payments action goes here
  end
end
