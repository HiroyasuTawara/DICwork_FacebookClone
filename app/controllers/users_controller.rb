class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  skip_before_action :login_required, only:[:new, :create]


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end


  def edit
  end


  def create
    @user = User.new(user_params)  
    if @user.save
      redirect_to user_path(@user.id), notice: "User was successfully created." 
    else
      render :new, status: :unprocessable_entity
    end
  end


  def update
    if @user.update(user_params)
      redirect_to user_url(@user), notice: "User was successfully updated." 
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @user.destroy
    redirect_to users_url, notice: "User was successfully destroyed."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end 

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
