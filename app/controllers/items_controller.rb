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
      redirect_to user_item_path(current_user, @item)
    else
      render :new
    end
  end

  def edit
    @item = current_user.items.find(params[:id])
  end

  def update
    @item = current_user.items.find(params[:id])

    if @item.update(item_params)
      redirect_to user_item_path(current_user, @item)
    else
      render :edit
    end
  end

  def destroy
    @item = current_user.items.find(params[:id])
    @item.destroy
    redirect_to user_items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :author, :status, :link, :notes)
  end
end
