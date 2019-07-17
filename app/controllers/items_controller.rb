class ItemsController < ApplicationController

  def create
    @menu = Menu.find(params[:menu_id])
    @item = @menu.items.create(item_params)
    redirect_to menu_path(@menu)
  end


  private
  def item_params
    params.require(:item).permit(:item_name, :price)
  end

end
