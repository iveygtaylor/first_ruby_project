class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find (params[:id])
  end

  def destroy
    User.destroy(params[:id])
    flash[:notice] = "User was deleted!"
    redirect_to users_path
  end

  def new
  end

  def create
    if User.create(user_params)
      flash[:notice] = "User successfully created!"
      redirect_to users_path
    else
      flash.now[:error] = "Please fix your errors."
      render "new"
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :fname,
      :lname,
      :email,
      :password,
      :username
    )
  end

end
