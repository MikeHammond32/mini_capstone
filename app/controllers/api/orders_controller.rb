class Api::OrdersController < ApplicationController
class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render 'index.json.jb'
  end

  def show
    @order = Order.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    # subtotal
    # quantity * price
  carted = current_user.carted_products.map{|product| product if product.status = "carted"}

    order 


    @order = []

  i = 0
  while i < carted.length
   tax = (params[:subtotal].to_f *
   0.09.to_f)/(100.to_i)
   total = tax.to_f + params[:subtotal].to_f
   @orders = Order.new(
   user_id: params[:user_id],
   subtotal: params[:subtotal], 
   tax: tax,
   total: total)

    @order.save
    @order << @orders
    i+=1
  end

  i = 0
  while i < carted.length
    carted[i].status = "purchased"
    carted[i].save
    i+=1
  end
  i = 0 
  while i < @order.length
    carted[i].status = "purchased"
    carted[i].save
    i+=1
  end
  render 'index.json.jb'

end