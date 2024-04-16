class ProfilesController < ApplicationController
  def index
    @profiles = Profile.order(:name, :phone_number, :email)
    render :index
  end

  def update
    # Your update logic here

    flash[:success] = "Settings updated successfully"
    redirect_to settings_path
  end
end
