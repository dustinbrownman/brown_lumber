require 'spec_helper'

describe "Admin pages" do
	subject { page }

	describe "signin link" do
		before { visit root_path }

		it "should apprear in the footer of page" do
			within('.footer') { page.should have_link 'Admin Sign in' }
		end

		it "should take the user to the login page" do
			click_link 'Admin Sign in'
			within('.main-section') { page.should have_content 'Admin Sign in' }
		end
	end

	describe "signing in" do
		before { visit new_admin_session_path }

		context 'with valid credentials' do
			let(:admin) { FactoryGirl.create(:admin) }

			before do
				fill_in 'Email', with: admin.email
				fill_in 'Password', with: admin.password
				click_on 'Sign in'
			end

			it { should have_content 'successfully' }
			it { should have_content 'Logged in as Admin' }
		end

		context 'with invalid credentials' do
			before do
				fill_in 'Email', with: 'someone@someplace.com'
				fill_in 'Password', with: 'blahblahblah'
				click_on 'Sign in'
			end

			it { should have_content "Invalid" }
		end
	end

	describe 'signing out' do
		let(:admin) { FactoryGirl.create(:admin) }

		before do
			sign_in(admin)
			click_on 'Sign out'
		end

		it { should have_content 'successfully' }
	end
end