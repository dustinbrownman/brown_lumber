require 'spec_helper'

describe "Admin pages" do
	describe "signin link" do
		before { visit root_path }

		it "should apprear in the footer of page" do
			within('.footer') { page.should have_link 'Admin Signin' }
		end

		it "should take the user to the login page" do
			click_link 'Admin Signin'
			page.should have_content 'Email'
		end
	end
end