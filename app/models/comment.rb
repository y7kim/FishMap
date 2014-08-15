class Comment < ActiveRecord::Base
	belongs_to :product

	validates_presence_of :name, :email, :body
	validate :product_should_be_created

	def product_should_be_created
		errors.add(:product_id, "is not created yet") if product && !product.created?
	end
end
