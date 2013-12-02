class MainCategoriesController < ApplicationController
	add_breadcrumb "Categories", :main_categories_path

	def index
		@main_categories = MainCategory.all
	end

	def show
		@main_category = MainCategory.find(params[:id])
		@main_categories = MainCategory.all
		add_breadcrumb @main_category.name, @main_category
	end
end
