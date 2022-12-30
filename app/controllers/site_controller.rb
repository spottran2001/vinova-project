class SiteController < ApplicationController
  before_action :current_product, only: [:show] 
  before_action :authenticate_user!, only: [:add_to_cart]

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
    @product = Product.find(params[:id])

    @product_list = Product.all
    @first_product = @product_list.first
    @products = @product_list.offset(1)
  end

  def collections
    filtered = Product.all

    if !params[:collection].blank?
      filtered = filtered.categories_search(params[:collection])
    end
    
    if !params[:categories].blank?
      filtered = filtered.categories_search(params[:categories])
    end

    if !params[:sort].blank?
      filtered = filtered.product_sort(params[:sort])
    end

    if !params[:filtered].blank?
      filtered = filtered.filtered_search(params[:filtered])
    end

    @pagy, @products = pagy(filtered.all, items: 12)
    @size = filtered.size
  end

  def new
  end

  def add_to_cart
    if current_user.cart.nil?
      current_user.create_cart!(:total_price => 0)
    end
    
    product_id = params[:cart][:product_id]
    check_product_id = current_user.cart
                                   .cart_details
                                   .where(product_id: product_id)
    if current_user.cart.cart_details.blank? 
      current_user.cart.cart_details.create(cart_params)
    else
      if check_product_id.blank?
        current_user.cart.cart_details.create(cart_params)
      else
        check_product_id.first
                        .update(product_quantity: 
                                check_product_id.first.product_quantity + 1) 
      end
    end
    flash[:notice] = "SUCCESSFULLY ADDED TO CART. "

    redirect_to site_path(product_id)
  end

  def send_mail
    ExampleMailer.sample_email(params[:site][:email]).deliver
  end

  private

  def current_product
    @product = Product.find(params[:id])
  end

  def cart_params
    params.require(:cart).permit(:product_id, :product_quantity, :product_price)
  end
end
