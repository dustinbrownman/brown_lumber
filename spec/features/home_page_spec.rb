require "rails_helper"

describe "Home page", type: :feature do
  it "renders" do
    visit "/"
    expect(page).to have_content "Welcome"
  end
end