class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render :error
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render :error
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:username,:email,:password,:password_confirmation))
      flash[:notice] = "#{@user.username}! Your account was updated sucessfully."
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(params.require(:user).permit(:username,:email,:password,:password_confirmation))
    if @user.save
      flash[:notice] = "Welcome #{params[:user][:username]}! your account was created sucessfully."
      redirect_to @user

    else
      render 'new'
    end
  end


end
