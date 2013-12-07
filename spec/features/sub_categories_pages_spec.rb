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

	describe 'edit page' do
		let(:admin) { FactoryGirl.create(:admin) }

		before do
			@product = FactoryGirl.create(:product)
			@sub_category = @product.sub_category
		end

		describe 'edit link' do
			it "should be accessbile to signed in admin" do
				sign_in(admin)
				visit sub_category_path(@sub_category)
				page.should have_link 'edit'
			end

			it "should not be accessbile others" do
				visit sub_category_path(@sub_category)
				page.should_not have_content 'edit'
			end
		end

		describe "visiting edit path" do
			context "as admin" do
				before do
					sign_in(admin)
					visit edit_sub_category_path(@sub_category)
				end

				it { should have_content "Edit your category" }
			end

			context "as visitor" do
				before { visit edit_sub_category_path(@sub_category) }

				it { should have_content 'You need to sign in' }
			end
		end

		describe 'updating category' do
			before do
				sign_in(admin)
				visit edit_sub_category_path(@sub_category)
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