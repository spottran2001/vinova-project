class ProductsController < ApplicationController
  before_action :authenticate_admin!
  before_action :current_product, only: [:show, :edit, :update, :destroy]

  def index
    filtered = Product.search(params)
    @pagy, @products = pagy(filtered.all, items: 10)
  end

  def show
      @product_photos = @product.product_photos.all
  end

  def new
    @product =  Product.new
    @product_photo = @product.product_photos.build
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      params[:product_photos]['photo'].each do |a|
        unless a.blank?
          @product_photo = @product.product_photos.create!(:photo => a)
        end
      end
      redirect_to products_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      params[:product_photos]['photo'].each do |a|
          unless a.blank?
            @product_photo = @product.product_photos.create!(:photo => a)
          end
      end
      redirect_to products_url
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url
  end

  private

  def product_params
    params
    .require(:product)
    .permit(:name, :price, :discount_percentage,
            {:categories => [] }, :company, :product_types, 
            :description, :return_policy, :citizen_policy,
            product_photos_attributes: [:id, :product_id, :photo])
  end

  def current_product
    @product = Product.find(params[:id])
  end
end
