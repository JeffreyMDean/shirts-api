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
end
