class ItemsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:destroy]

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = "To do item created!"
      redirect_to root_url
    else
      @items = [ ]
      render 'static_pages/home'
    end
  end

  def destroy
    @item.destroy
    flash[:success] = "Item deleted"
    redirect_to request.referrer || root_url
  end

  private
    def item_params
      params.require(:item).permit(:name)
    end

    def correct_user
      @item = current_user.items.find_by(id: params[:id])
      redirect_to root_url if @item.nil?
    end
end
