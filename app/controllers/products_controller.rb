class ProductsController < ApplicationController
  def index
   @products = Products.all
   render "index.html.erb"
  end
  end
  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      user_id: params[:user_id]
    )
    @product.save

    render 'show.html.erb'

    end
  def edit
    @product = Product.find_by(id: params[:id])
    render 'edit.html.erb'
  end
  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
    name: params[:name],
    description: params[:description],
    price: params[:price],
    user_id: params[:user_id]

      )
  end
  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    redirect_to "/products"
  end
end
