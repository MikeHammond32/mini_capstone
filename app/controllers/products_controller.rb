class ProductsController < ApplicationController
  def index
   @products = Products.all
   render "index.html.erb"
  end
  end
end
