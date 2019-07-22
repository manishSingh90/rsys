class UsersController < ApplicationController

  # refer https://www.javatpoint.com/ruby-on-rails-session

  # before_action :user, except: [:new, :index, :create]
  before_action :user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    # @user = User.find(params[:id])
    # To increase performance
    @user = User.preload(:address).find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :gender, :dob, :email, :phone_number, :password)
  end

end
