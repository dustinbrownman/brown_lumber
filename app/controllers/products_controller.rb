class ProductsController < ApplicationController
	before_action :authenticate_admin!, only: [:edit, :update]

	def show
		@main_categories = MainCategory.all
		@product = Product.find(params[:id])
		add_breadcrumb "Categories", main_categories_path
		add_breadcrumb @product.sub_category.main_category.name, @product.sub_category.main_category
		add_breadcrumb @product.sub_category.name, @product.sub_category
		add_breadcrumb @product.description, @product
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])

		if @product.update(product_params)
			redirect_to @product.sub_category, notice: 'Product successfully updated!'
		else
			render :edit
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@sub_category = @product.sub_category
		@product.destroy
		flash[:notice] = "The product has been removed."
		redirect_to @sub_category
	end

private

	def product_params
		params.require(:product).permit(:description, :part_number, :barcode_number,
																		:units, :weight, :length)
	end
end