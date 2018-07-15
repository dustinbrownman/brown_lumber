class SubCategoriesController < ApplicationController
	before_filter :authenticate_admin!, only: [:edit, :update]

	def show
		@main_categories = MainCategory.all.order(:id)
		@sub_category = SubCategory.find(params[:id])
		add_breadcrumb "Categories", main_categories_path
		add_breadcrumb @sub_category.main_category.name, @sub_category.main_category
		add_breadcrumb @sub_category.name, @sub_category
	end

	def edit
		@sub_category = SubCategory.find(params[:id])
	end

	def update
		@sub_category = SubCategory.find(params[:id])

		if @sub_category.update(main_category_params)
			redirect_to @sub_category, notice: 'Category successfully updated!'
		else
			render :edit
		end
	end

private

	def main_category_params
		params.require(:sub_category).permit(:name, :description, :image)
	end
end