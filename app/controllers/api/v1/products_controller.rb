module Api
  module V1
    class ProductsController < ApplicationController
      before_action :set_post, only: [:show, :update, :destroy]
      def index
        @product = Product.all
        render json: @product
      end

      def show
        @product = Product.find( params[:id])
        render json: @product
      end

      def create
          product = Product.new(product_params)
        if product.save
          render json: { status: 'SUCCESS', data: product }
        else
          render json: { status: 'ERROR', data: product.errors }
        end
        # @product = Product.create(product: params[:product])
        # render json: @product
      end

      def update
        @product = Product.find(params[:id])
        @product.update_attributes(product: params[:product])
        render json: @product
      end

      def destroy
        @product = Product.find(params[:id])
        if @product.destroy
          head :no_content, status: :ok
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      private
      def set_product
        @product = Product.find(params[:id])
      end

      def product_params
        params.require(:product).permit(:product)
      end
    end

  end
end