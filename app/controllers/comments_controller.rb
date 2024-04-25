# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shared_experience

  def create
    @comment = @shared_experience.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to shared_experiences_path, notice: 'Comment was successfully created.'
    else
      redirect_to shared_experiences_path, alert: 'Comment creation failed.'
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    redirect_to shared_experiences_path, notice: 'Comment was successfully destroyed.'
  end

  private

  def set_shared_experience
    @shared_experience = SharedExperience.find(params[:shared_experience_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
