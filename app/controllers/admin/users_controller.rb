class Admin::UsersController < ApplicationController

  def index
    @users = User.order :name
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:notice] = I18n.t "admin.user.create"
      redirect_to admin_users_path
    else
      render "new"
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @users.update_attributes params[:users]
      flash[:notice] = I18n.t "admin.user.update"
      redirect_to admin_users_path
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find params[:id].destroy
    flash[:notice] = I18n.t "admin.user.destroy"
    redirect_to admin_users_path
  end

  def user_params
    params.require(:user).permit :name, :email, :password
  end
end
