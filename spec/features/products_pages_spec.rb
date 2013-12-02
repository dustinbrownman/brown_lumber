require 'spec_helper'

describe "Products pages" do
	subject { page }

	describe "show page" do
		before do
			@product = FactoryGirl.create(:product)
			visit product_path(@product)
		end

		it { should have_content @product.description }
		it { should have_link @product.sub_category.name }
	end
end