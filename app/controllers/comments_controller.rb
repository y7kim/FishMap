class CommentsController < ApplicationController
	before_action :load_product, :except => :destroy
	before_action :authenticate, :only => :destroy

	def create
		@comment = @product.comments.new(comment_params)
		if @comment.save
			redirect_to @product, notice: "Thanks for your comment"
		else
			redirect_to @product, alert: "Unable to add comment"
		end
	end

	def destroy
		@product = current_user.products.find(params[:product_id])
		@comment = @product.comments.find(params[:id])
		@comment.destroy
		redirect_to @product, notice: "Comment Deleted"
	end

	private
	def load_product
		@product = Product.find(params[:product_id])
	end

	def comment_params
		params.require(:comment).permit(:name, :email, :body)
	end


end
