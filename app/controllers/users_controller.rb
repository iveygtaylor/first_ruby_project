class UsersController < ApplicationController
def index
  if params[:query]
    @users = User.where('lower(fname) LIKE ? OR lower(lname) LIKE ?', params[:query].downcase, params[:query].downcase)
  else
    @users = User.all
  end
end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.destroy(params[:id])
    flash[:notice] = "User was deleted!"
    redirect_to users_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
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
