class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
  end

  def index2
    @products = Product.order(price: :asc )
    render "index"
  end

  def index3
    @products = Product.order(price: :desc )
    render "index"
  end

end
