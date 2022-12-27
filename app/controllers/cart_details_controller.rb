class CartDetailsController < ApplicationController
  def create
    @cart = current_user.cart
    @cart_detail = @cart.cart_details.new(cart_params)
    @cart.save
  end

  def destroy
		@cart_detail = CartDetail.find(params[:id])
		@cart_detail.destroy		

    redirect_to carts_path
	end

  private

  def cart_params
    params.require(:cart_detail).permit(:product_id, :product_quantity)
  end
end
