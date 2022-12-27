class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :check_cart, only: [:index]

  def index
    @cart_details = current_user.cart.cart_details
  end

  def create
  end

  private

  def check_cart
    if current_user.cart.nil?
      current_user.create_cart!(:total_price => 0)
    end
  end
end
