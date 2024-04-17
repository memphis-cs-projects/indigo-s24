class SettingsController < ApplicationController
  before_action :authenticate_user!
  def profiles
   @profiles = Profile.order(:name, :phone_number, :email, :address)
    render :profiles
  end

  def payments
    # Your logic for the payments action goes here
  end
end
