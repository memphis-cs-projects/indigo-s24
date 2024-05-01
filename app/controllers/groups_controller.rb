
require 'join_group' # Import the JoinGroup model if necessary
class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show, :join, :view, :edit, :update, :destroy]


  def new
    @group = Group.new
    render :new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      JoinedGroup.create(user: current_user, group: @group)
      redirect_to joined_groups_path, notice: 'Group was successfully created and joined.'
    else
      render :new
    end
  end

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def view_group
    @groups = Group.all # Fetch all groups
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to joined_groups_path, notice: 'Group was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id]) # Retrieve the group by its ID
    @group.destroy if @group.present? # Check if the group exists before calling destroy
    redirect_to nomad_connect_path, notice: 'Group was successfully deleted.'
  end

  # private

  # def set_group
  #   @group = Group.find(params[:id])
  # end


  def join
    group = Group.find(params[:group_id])
    #join_group = JoinedGroup.new(user: current_user, group: group) # Use JoinedGroup instead of JoinGroup
    if JoinedGroup.exists?(user: current_user, group: group)
      redirect_to groups_path, alert: "You are already a member of this group."
    else
      join_group = JoinedGroup.new(user: current_user, group: group)
    if join_group.save
      redirect_to joined_groups_path, notice: "Successfully joined the group."
    else
      redirect_to join_group_path, alert: "Failed to join the group."
    end
  end
end

  def joined_groups
    @joined_groups = current_user.joined_groups.includes(:group)
  end

  private

  def group_params
    params.require(:group).permit(:group_name, :group_size, :adventure_location, :other_information)
  end
end
