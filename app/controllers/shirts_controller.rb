class ShirtsController < ApplicationController
  def index
    @shirts = Shirt.all
    render template: "shirts/index"
  end

  def create
    @shirt = Shirt.create(
      style: params[:style],
      color: params[:color],
      size: params[:size]
    )
    render :show
  end

  def show
    @shirt = Shirt.find_by(id: params[:id])
    render :show
  end

  def update
    @shirt = Shirt.find_by(id: params[:id])
    shirt.update(
      style: params[:style] = @shirt.style || @shirt.style,
      color: params[:color] = @shirt.color || @shirt.color,
      size: params[:size] = @shirt.size || @shirt.size
    )
    render :show
  end
end
