# frozen_string_literal: true
class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = current_user.items
  end

  def show
    @item = current_user.items.find(params[:id])
  end

  def new
    @item = item_type.new(user: current_user)
  end

  def create
    @item = item_type.new(item_params)
    @item.user = current_user

    if @item.save
      redirect_to polymorphic_path([current_user, @item])
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
      redirect_to polymorphic_path([current_user, @item])
    else
      render :edit
    end
  end

  def destroy
    @item = current_user.items.find(params[:id])
    @item.destroy
    redirect_to polymorphic_path([current_user, @item])
  end

  private

  def item_types
    ["Book", "TvShow", "Movie", "Music"]
  end

  def item_type
    params[:type].constantize if params[:type].in? item_types
  end

  def item_params
    case params[:type]
    when "Book"
      params.require(:book).permit(:name, :author, :status, :link, :notes)
    else
      params.require(:item).permit(:name, :author, :artist, :status, :link, :notes)
    end
  end
end
