require 'spec_helper'

describe "SubCategory pages" do
	subject { page }

	describe "show page" do
		before {
			@product = FactoryGirl.create(:product)
			@sub_category = @product.sub_category
			visit sub_category_path(@sub_category)
		}

		it { should have_content @sub_category.name }
		it { should have_content @sub_category.description }
		it { should have_content @product.description }
	end
end