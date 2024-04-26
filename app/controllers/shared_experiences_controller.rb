# app/controllers/shared_experiences_controller.rb
class SharedExperiencesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shared_experience, only: [:show, :edit, :update, :destroy]

  def index
    @shared_experiences = SharedExperience.all
  end

  def new
    @shared_experience = SharedExperience.new
  end

  def create
    @shared_experience = current_user.shared_experiences.build(shared_experience_params)
    if @shared_experience.save
      redirect_to shared_experiences_path, notice: 'Shared experience was successfully created.'
    else
      render :new
    end
  end

  private

  def set_shared_experience
    @shared_experience = SharedExperience.find(params[:id])
  end

  def shared_experience_params
    params.require(:shared_experience).permit(:title, :description)
  end
end
