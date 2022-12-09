class SiteController < ApplicationController
  before_action :current_product, only: [:show, :update_favorite] 
  
  #home page
  def index
    @new_product_list = Product.all.order(created_at: :desc)
    @new_product = @new_product_list.first
    @new_products = @new_product_list.offset(1)

    @discount_product_list = Product.all.order(discount_percentage: :desc)
    @discount_product = @discount_product_list.first
    @discount_products = @discount_product_list.offset(1)


    @top_selling_product_list = Product.all.order(quantity_sold: :desc)
    @top_selling_product = @top_selling_product_list.first
    @top_selling_products = @top_selling_product_list.offset(1)
  end

  #product details
  def show 
    @product_photos = @product.product_photos.all

    @product_list = Product.all
    @first_product = @product_list.first
    @products = @product_list.offset(1)
  end

  def new
    
  end
  #check this 
  # def update_favorite
  #   @product.favorite = !@product.favorite
  # end

  private

  def current_product
    @product = Product.find(params[:id])
  end
end
