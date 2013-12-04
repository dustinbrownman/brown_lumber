require 'spec_helper'

describe 'Main Category Pages' do
	subject { page }

	describe 'navigating to categories page' do
		before do
			@main_category = FactoryGirl.create(:main_category)
			visit root_path
			click_on 'Products'
		end

		it { should have_content @main_category.name }
	end

	describe 'index page' do
		before do
			@main_categories = []
			5.times { @main_categories << FactoryGirl.create(:main_category) }
			visit main_categories_path
		end

		it { should have_content @main_categories[0].name }
		it { should have_content @main_categories[1].name }
		it { should have_content @main_categories[2].name }
		it { should have_content @main_categories[3].name }
		it { should have_content @main_categories[4].name }
	end

	describe 'navigating to single category page' do
		before do
			@main_category = FactoryGirl.create(:main_category)
			visit main_categories_path
			within('.content') { click_link @main_category.name }
		end

		it { should have_content @main_category.name }
	end

	describe 'show page' do
		before do
			@product = FactoryGirl.create(:product)
			@sub_category = @product.sub_category
			@main_category = @sub_category.main_category
			visit main_category_path(@main_category)
		end

		it { should have_content @main_category.name }
		it { should have_content @main_category.description }
		it { should have_content @sub_category.name }
		
		# May need to add this back in if we decide we want products listed on this page
		# it { should have_content @product.description }
	end
end
