class UsersController < ApplicationController

  def new
    @page_title = "Register New User"
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @page_title = "Edit User Profile"
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(post_params)
      redirect_to @user
    else
      render :edit
    end
  end



  def author_params
    params.require(:user).permit(:name, :email, :password)
  end

end
