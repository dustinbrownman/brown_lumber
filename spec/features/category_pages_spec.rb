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

	describe 'edit page' do
		let(:admin) { FactoryGirl.create(:admin) }

		before do
			@product = FactoryGirl.create(:product)
			@sub_category = @product.sub_category
			@main_category = @sub_category.main_category
		end

		describe 'edit link' do
			it "should be accessbile to signed in admin" do
				sign_in(admin)
				visit main_category_path(@main_category)
				page.should have_link 'edit'
			end

			it "should not be accessbile others" do
				visit main_category_path(@main_category)
				page.should_not have_content 'edit'
			end
		end

		describe "visiting edit path" do
			before { visit edit_main_category_path(@main_category) }

			context "as admin" do

			end

			context "as visitor" do
				it { should have_content 'You need to sign in' }
			end
		end

		describe 'updating category' do
			before do
				sign_in(admin)
				visit edit_main_category_path(@main_category)
			end

			context 'with valid information' do
				before do
					fill_in 'Name', with: 'New name'
					fill_in 'Description', with: 'New description'
					click_on 'Update'
				end

				it { should have_content 'successfully' }
			end

			context 'wtih invalid information' do
				before do
					fill_in 'Name', with: ''
					click_on 'Update'
				end

				it { should have_content 'blank' }
			end
		end
	end
end
