class StaticPagesController < ApplicationController
  def home
    if signed_in?
    @item = current_user.items.build 
    @items = current_user.items.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end
end
