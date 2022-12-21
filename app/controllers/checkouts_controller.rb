class CheckoutsController < ApplicationController
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
             .create(:product_price => details.product_price,
                     :product_quantity => details.product_quantity,
                     :product_id => details.product_id)
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