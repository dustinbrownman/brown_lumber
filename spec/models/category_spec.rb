require 'spec_helper'

describe Category do
	it { should validate_presence_of :name }
	it { should validate_uniqueness_of :name }
	it { should have_many :subcategories }
	it { should belong_to :parent_category }
end

describe '#subcategories' do
	it "should return all associated categories" do
		category = FactoryGirl.create(:category)
		subcategory = FactoryGirl.create(:category, parent_category: category)
		category.subcategories.first.should eq subcategory
	end
end
