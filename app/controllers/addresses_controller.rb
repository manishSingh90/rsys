class AddressesController < ApplicationController
  before_action :user


  # def index
  # end

  def new
    @address = @user.build_address
  end

  def create
    # @user = User.find(params[:user_id])
    # use create_address for has_on association
    @address = @user.create_address(address_params)

    binding.pry

    redirect_to user_path(@user)
  end


  private

  def user
    @user = User.find(params[:user_id])
  end

  def address_params
    params.require(:address).permit(:address1, :address2, :country, :state, :zip)
  end

end
