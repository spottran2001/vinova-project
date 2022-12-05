class SiteController < ApplicationController
  before_action :current_product, only: [:show, :update_favorite] 
  def index
  end

  def show 
  end

  #check this 
  # def update_favorite
  #   @product.favorite = !@product.favorite
  # end

  private

  def current_product
    @product = Produc.find(params[:id])
  end
end
