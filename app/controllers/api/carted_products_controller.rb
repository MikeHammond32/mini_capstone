class Api::CartedProductsController < ApplicationController
  def index
    @cartedproducts = CartedProduct.all
    if current_user
      @cartedproducts = @cartedproducts.where(status: "carted")
    end

    render 'index.json.jb'
  end


  def create
    @carted = CartedProduct.create(
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: params[:status],
      order_id: params[:order_id],
      user_id: params[:user_id]
      )
    
    render 'show.json.jb'

end
end