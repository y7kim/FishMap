class CreateProductsCategories < ActiveRecord::Migration
  def change
  	#:id => false #Do not create primary keys
    create_table :products_categories, :id => false do |t|
    	t.references :product
    	t.references :category
    end
  end
  def self.down
  	drop_table :products_categories
  end
end
