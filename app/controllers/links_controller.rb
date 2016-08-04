class LinksController < ApplicationController

  before_action :require_user, except: [:index, :show]
  before_action :set_link, only: [:show]

  def index
    @page_title = "Main Page"
    @links = Link.all.page(params[:page]).per(50)
  end

  def show
    @comment = Comment.new
  end

  def new
    @page_title = "New Post"
    @link = Link.new
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @page_title = "Edit Post"
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to root_path
  end

  def upvote
    @link = Link.find(params[:id])
    @link.increment!(:votes)
    redirect_to @link.link
  end

  def upvote_button
    @link = Link.find(params[:id])
    @link.increment!(:votes)
    render :downvote

  end

  def downvote_button
    @link = Link.find(params[:id])
    @link.decrement!(:votes)
    render :downvote
  end

  private

    def set_link
      @link = Link.find(params[:id])
    end

  def link_params
    params.require(:link).permit(:title, :link, :thumbnail, :subreddit_id, :summary)
  end

end
