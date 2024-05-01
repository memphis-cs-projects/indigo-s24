class SettingsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Your index action logic goes here
  end

  def profiles
    @profiles = Profile.order(:name, :phone_number, :email, :address)
    render :profiles
  end

  def payments
    # Your payments action logic goes here
  end
end
