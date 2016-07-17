class SubredditsController < ApplicationController

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


  def subreddit_params
    params.require(:subreddit).permit(:category)
  end


end
