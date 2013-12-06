require 'spec_helper'

def sign_in(admin)
  visit new_admin_session_path
  fill_in "Email", :with => admin.email
  fill_in "Password", :with => admin.password
  click_button "Sign in"
end