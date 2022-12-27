class OrdersController < ApplicationController
  before_action :authenticate_admin!
  before_action :current_order, only: [:show, :destroy]

  def index
    filtered = Order.search(params)
    @pagy, @orders = pagy(filtered.all, items: 10)
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(@current_user.cart)

    if @order.save
      redirect_to :controller => 'checkout', :action => 'index' 
    end
  end

  def show
    @order_details = Order.find(params[:id]).order_details
    @total = 0
  end

  def destroy
    @current_order.destroy
    redirect_to orders_url
  end

  private

  def current_order
    @current_order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit()
  end
end
