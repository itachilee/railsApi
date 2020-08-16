module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: [:show, :update, :destroy]

      def index
        posts = Post.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded posts', data: posts }
      end

      def show
        # render json: { status: 'SUCCESS', message: 'Loaded the post', data: @post }
        render json: { status: 'SUCCESS', message: 'Loaded the post', data: post_params }
      end

      def create
        post = Post.new(post_params)
        if post.save
          render json: { status: 'SUCCESS', data: post }
        else
          render json: { status: 'ERROR', data: post.errors.exception }
        end
      end

      def destroy
        if @post.destroy
          render json: { status: 'SUCCESS', message: 'Deleted the post', data: @post }
        else
          render json: { status: 'ERROR',data: @post.error.exception }
        end
      end

      def update
        if @post.update(post_params)
          render json: {status: 'SUCCESS', message: 'Updated the post', data: @post}
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: @post.errors.exception }
        end
      end

      private

      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:title)
      end
    end
  end
end