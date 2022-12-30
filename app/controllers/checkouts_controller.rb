class CheckoutsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @checkout =  Checkout.new
  end

  def create
    @checkout = Checkout.new(checkout_params)

    if @checkout.save
      @order = current_user.orders.create(:total_price => 0, :status => "pending")

      current_user.cart.cart_details.each do |details|
        @order.order_details
             .create(:product_price => details.product_price * (100-details.product.discount_percentage)/100,
                     :product_quantity => details.product_quantity,
                     :product_name => details.product.name,
                     :photo => details.product.product_photos.first.photo,
                     :product_id => details.product_id)
        product_quantity_sold = details.product.quantity_sold
              

        details.product.update(quantity_sold: product_quantity_sold += details.product_quantity)
      end
      current_user.cart.destroy

      redirect_to new_order_payment_path(@order, checkout_id: @checkout.reload)
      #redirect_to new_payment_path, :order => @order
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def checkout_params
    params.require(:checkout).permit(:first_name, :last_name,
                                     :address, :secound_address,
                                     :postal_code, :country,
                                     :phone_number, :user_id)
  end
end