class CommentsController < ApplicationController
  before_action :require_user, only: [:create]
  before_action :set_comment, only: [:show]

  def create
    @comment = current_user.comments.create!(
      link_id: params[:link_id],
      body: params[:comment][:body]
    )
    respond_to do |format|
      format.json {
        render json: @comment
      }
    end
  end

  def show
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

end
