require "rails_helper"

describe "Products page", type: :feature do
  before do
    @category = MainCategory.create({ name: "Something" })
  end

  it "navigating from home page" do
    visit "/"
    click_link "Products"

    expect(page).to have_content @category.name
  end
end