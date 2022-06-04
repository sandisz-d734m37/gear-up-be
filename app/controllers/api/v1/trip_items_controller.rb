class Api::V1::TripItemsController < ApplicationController
  def index
    render json: TripItemSerializer.new(TripItem.where("trip_id = ?", params[:trip_id]))
  end

  # def create
  #   render json: ItemSerializer.new(Item.create!(item_params)), status: :created
  # end
  #
  # def update
  #   item = Item.find(params[:item_id])
  #   if item.update(item_params)
  #     render json: ItemSerializer.new(item), status: 201
  #   else
  #     render status: 404
  #   end
  # end
  #
  # def destroy
  #   item = Item.find(params[:item_id])
  #   item.destroy
  #   render status: 204
  # end
  #
  # private
  #
  # def item_params
  #   params.require(:item).permit(:name, :description, :count, :category, :user_id)
  # end
end
