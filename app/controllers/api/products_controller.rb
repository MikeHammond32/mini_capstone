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

def create
  @product = Product.new(
  {
    name: params[:input_name],
    image_url: params[:input_image_url],
    description: params[:input_description],
    price: params[:price_url]
    
  })
  @product.save
  render 'create.json.jb'
  
end

def update
  the_id = params[:id]
  @product = Product.find_by(id: the_id)
  @product.name = params[:input_name]
  @product.description = params[:input_description]
  @product.image_url = params[:input_image_url]
  @product.price = params[:input_price]
  @product.save
  render 'update.json.jb'
    
end
def destroy
  the_id = params[:id]
  product = Product.find_by(id: the_id)
  product.destroy

  render 'destroy.json.jb'
end
#change url parameter so that a different item shows up
# find a way to connect the userinput to the id that I have saved for each product
end