class MainCategoriesController < ApplicationController
	before_filter :authenticate_admin!, only: [:edit, :update]

	add_breadcrumb "Categories", :main_categories_path

	def index
		@main_categories = MainCategory.all
	end

	def show
		@main_category = MainCategory.find(params[:id])
		@main_categories = MainCategory.all
		add_breadcrumb @main_category.name, @main_category
	end

	def edit
		@main_category = MainCategory.find(params[:id])
	end

	def update
		@main_category = MainCategory.find(params[:id])

		if @main_category.update(main_category_params)
			redirect_to @main_category, notice: 'Category successfully updated!'
		else
			render :edit
		end
	end

private

	def main_category_params
		params.require(:main_category).permit(:name, :description)
	end
end
