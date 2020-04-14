class Api::ItemsController < ApplicationController
  
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: item
    else 
      render json: {message: 'Item Created'}
    end
  end

private
    
  def item_params
    params.require(:item).permit(:name, :image, :description, :likes)
  end
end