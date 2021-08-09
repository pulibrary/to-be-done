# frozen_string_literal: true
class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def show
    @item = current_user.items.find(params[:id])
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)

    if @item.save
      redirect_to user_item_path(current_user, @item), notice: "Item was successfully created."
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :author, :status, :link, :notes)
  end
end
