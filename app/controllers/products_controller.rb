class ProductsController < ApplicationController
    before_action :current_product, only: [:show, :edit, :update, :destroy]

    def index
        @products = Product.all
        @new_product = @products.order(:created)
        @discount_product = @products.order(:discount_percentage)
        @top_selling_product = @products.order(:quantity_sold)
    end

    def show
    end

    def new
        @product =  Product.new
    end

    def create
        @product = Product.new(product_params)
    end

    def edit
    end

    def update
        if @current_product.update(product_params)
            redirect_to @current_product
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @current_product.destroy
    end

    private

    def product_params
        params
        .require(:product)
        .permit(:name, :price, :discount_percentage,
                :categories, :company, :product_type, 
                :description, :return_policy, :citizen_policy)
    end

    def current_product
        @current_product = Product.find(params[:id]))
    end
end
