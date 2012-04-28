class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create 
    @order = Order.new(params[:order])

    if @order.save
      flash[:notice] = "File uploaded"
      redirect_to order_path(@order)
    else
      flash[:error] = "Something didn't go quite right there"
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end

end
