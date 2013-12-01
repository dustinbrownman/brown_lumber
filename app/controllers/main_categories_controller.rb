class MainCategoriesController < ApplicationController
	def index
		@main_categories = MainCategory.all
	end
end
