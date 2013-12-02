class ProductsController < ApplicationController
	def show
		@main_categories = MainCategory.all
		@product = Product.find(params[:id])
		add_breadcrumb "Categories", main_categories_path
		add_breadcrumb @product.sub_category.main_category.name, @product.sub_category.main_category
		add_breadcrumb @product.sub_category.name, @product.sub_category
		add_breadcrumb @product.description, @product
	end
end