class UserSessionsController < ApplicationController

  before_action :disallow_user, except: [:destroy]
  before_action :require_user, only: [:destroy]

  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user
      if @user.authenticate(params[:password])
        session[:name] = @user.name
        redirect_to root_path
      else
        render new_user_path
      end
    else
      render new_user_path
    end
  end

  def destroy
    session[:name] = nil
    redirect_to root_path
  end



end
