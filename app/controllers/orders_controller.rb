class OrdersController < ApplicationController
    before_action :current_order, only: [:show, :destroy]

    def index
        @orders = Order.all.order(:id)
    end

    def new
        @order = Order.new
    end

    def create
        @order = Order.new(Cart.find(id: @current_user.id))

        if @order.save
            redirect_to :controller => 'checkout', :action => 'index' 
        end
    end

    def show
        @order = Order.find(params[:id])
    end

    def destroy
        @current_order.destroy
        redirect_to orders_url
    end

    private

    def current_order
        @current_order - Order.find(params[:id])
    end

    def order_params
        params.require(:order).permit()
    end

end
