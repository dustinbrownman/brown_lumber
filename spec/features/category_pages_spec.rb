require 'spec_helper'

describe 'Main Category Pages' do
	subject { page }

	describe 'navigating to products page' do
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
end
