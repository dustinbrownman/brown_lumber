class SubCategoriesController < ApplicationController

	def show
		@main_categories = MainCategory.all
		@sub_category = SubCategory.find(params[:id])
		add_breadcrumb "Categories", main_categories_path
		add_breadcrumb @sub_category.main_category.name, @sub_category.main_category
		add_breadcrumb @sub_category.name, @sub_category
	end
end