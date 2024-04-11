class GroupsController < ApplicationController

  def new
    @group = Group.new
    render :new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      # Handle successful save
    else
      # Handle save failure
      errors = @group.errors.full_messages
      puts errors
    end
  end  

  private

def group_params
  params.require(:group).permit(:group_name, :group_size, :adventure_location, :other_information)
end
end
