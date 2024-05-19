class ShirtsController < ApplicationController
  def index
    @shirts = Shirt.all
    render template: "shirts/index"
  end
end
