class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:view_group]

  def new
    @group = Group.new
    render :new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_path(@group), notice: 'Group was successfully created.'
    else
      render :new
    end
  end
  
  def show
    @group = Group.find(params[:id])
  end

  def join
    group_id = params[:group_id]
    redirect_to view_group_path(group_id: group_id)
    # group_id = params[:group_id].to_i
    # JoinedGroup.create(user_id: current_user.id, group_id: group_id)
  end

  def join_group
    @groups = Group.all # Fetch all groups
  end

  def view_group
    group_id = params[:group_id]
    @group = Group.find(group_id)
    #@joined_groups = JoinedGroup.includes(:group).where(user_id: current_user.id)
  end

  private

  def group_params
    params.require(:group).permit(:group_name, :group_size, :adventure_location, :other_information)
  end
end
