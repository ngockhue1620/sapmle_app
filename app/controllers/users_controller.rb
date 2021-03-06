class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by id: params[:id]
    return if @user.present?
    flash[:warning] = t "not_found"
    redirect_to root_url
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end

end
