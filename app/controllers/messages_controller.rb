class MessagesController < ApplicationController
  before_action :set_group
  before_action :authenticate_user!

  def index
    @messages = @group.messages.includes(:user).order(created_at: :asc)
    @message = Message.new
  end

  def create
    @message = @group.messages.build(message_params)
  @message.user = current_user

  respond_to do |format|
    if @message.save
      format.html { redirect_to group_messages_path(@group), notice: 'Message sent!' }
      format.js   # This will look for a create.js.erb view to execute
    else
      format.html { render :index }
      format.js   # You can also handle errors with JS
    end
  end


  end

  private

def set_group
  @group = Group.find(params[:group_id])
rescue ActiveRecord::RecordNotFound
  redirect_to root_path, alert: 'Group not found'
end

  def message_params
    params.require(:message).permit(:content)
    # Make sure to permit any other parameters you need
  end
end
