class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index.json.jb'
  end
def show
  the_id = params[:id]
  @product = Product.find_by(id: params[:id])
  render 'show.json.jb'
end
  # def allproducts
  #   @products = Product.all
  #   render 'all.json.jb'

def create
  @product = Product.new(
  {
    name: params[:name],
    image_url: params[:image_url],
    description: params[:description],
    price: params[:price]
    
  })
  @product.save
  render 'create.json.jb'
  
end

def update
  the_id = params[:id]
  @product = Product.find_by(id: params[:id]) 
  @product.name = params[:name]
  @product.description = params[:idescription]
  @product.image_url = params[:image_url]
  @product.price = params[:price]
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