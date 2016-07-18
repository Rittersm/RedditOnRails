class UserSessionsController < ApplicationController

  before_action :disallow_user, except: [:destroy]

  def new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user
      if @user.authenticate(params[:session][:password])
        session[:username] = @user.name
        redirect_to @user
      else
        render new_user_path
      end
    else
      render new_user_path
    end
  end

  def destroy
    session[:username] = nil
    redirect_to :login
  end

end
