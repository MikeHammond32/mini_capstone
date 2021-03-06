class Api::ProductsController < ApplicationController
  def index
    if params[:sort] 
    @products = Product.all.order(price: :asc)
    else
    @products = Product.all
    end
  @products = @products.order(:id => :asc)
    render 'index.json.jb'
  end
end
def show
  # product_search = params[:search]
  the_id = params[:id]
  @product = Product.find_by(id: the_id)
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
  if @product.save
  render 'create.json.jb'
  else
  render 'error.json.jb'
  end
end

def update
  the_id = params[:id]
  @product = Product.find_by(id: params[:id]) 
  @product.name = params[:name] || product.name
  @product.description = params[:idescription] || product.description
  @product.image_url = params[:image_url] || product.image_url
  @product.price = params[:price] || product.price
  
  if @product.save
    render 'update.json.jb'
  else
    render 'error.json.jb'
  end  
end
def destroy
  the_id = params[:id]
  product = Product.find_by(id: the_id)
  product.destroy

  render 'destroy.json.jb'
end
#change url parameter so that a different item shows up
# find a way to connect the userinput to the id that I have saved for each product
