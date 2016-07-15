class LinksController < ApplicationController

  def index
    @page_title = "Main Page"
    @links = Link.all.order(votes: :desc).page(params[:page]).per(50)
  end

  def show
    @page_title = @links.title
    @links = Link.all.detect{|link| link.id == params[:id].to_i}
  end

  def new
    @page_title = "New Post"
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to @link
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
      redirect_to @link
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
  end

  private

    def link_params
      params.require(:link).permit(:title, :user_id, :link, :thumbnail, :votes)
    end

end
