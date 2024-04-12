class GroupsController < ApplicationController

  def new
    @group = Group.new
    render :new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to @group, notice: 'Group was successfully created.'
    else
      render :new
    end
  end
  
  def show
    @group = Group.find(params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:group_name, :group_size, :adventure_location, :other_information)
  end
end
