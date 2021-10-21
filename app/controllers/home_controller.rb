class HomeController < ApplicationController

  def index
    variants = Product.eager_load(:variants)
    @products = Product.catalog(variants)
  end
end
