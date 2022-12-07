class ProductPhotosController < ApplicationController
    def destroy
        @product_photo = ProductPhoto.find(params[:id])
        product = @product_photo.product
        @product_photo.destroy
        respond_to do |format|
            redirect_to product_url(product)
        end
    end
end