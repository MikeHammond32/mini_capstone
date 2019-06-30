class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index.json.jb'
      end
def show
  the_id = params[:id]
  @products = Product.find_by(id: the_id)
  render 'show.json.jb'
end
  # def allproducts
  #   @products = Product.all
  #   render 'all.json.jb'

  # end


    



#change url parameter so that a different item shows up
# find a way to connect the userinput to the id that I have saved for each product
end