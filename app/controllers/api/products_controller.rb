class Api::ProductsController < ApplicationController
def view
  @product = Product.first
  render 'product.json.jb'
end
end