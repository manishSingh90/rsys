class UsersController < ApplicationController

  # refer https://www.javatpoint.com/ruby-on-rails-session

  # before_action :require_user, only: [:index, :show, :new]
  # before_action :require_user_logout, only: [:create, :new]
  # before_action :require_user_logout, only: [:new]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :password)
  end

end
