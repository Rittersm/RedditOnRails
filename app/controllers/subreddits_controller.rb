class SubredditsController < ApplicationController

  before_action :require_user, except: [:index, :show]

  def index
    @page_title = "All Subreddits"
    @subreddits = Subreddit.all.order(category: :desc)
  end

  def show
    @subreddits = Subreddit.all.detect{|subreddit| subreddit.id == params[:id].to_i}
    @links = Link.where("subreddit_id = ?", params[:id].to_i).order(votes: :desc).page(params[:page]).per(50)
  end

  def new
    @page_title = "Create New Subreddit"
    @subreddit = Subreddit.new
  end

  def create
    @subreddit = Subreddit.new(subreddit_params)
    if @subreddit.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def subreddit_params
    params.require(:subreddit).permit(:category, :description)
  end


end
