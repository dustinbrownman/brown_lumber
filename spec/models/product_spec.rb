require 'spec_helper'

describe Product do
  it { should validate_presence_of :description }
  it { should belong_to :sub_category }

  describe '.import' do
  	before { Product.import(File.open('tmp/sample_data.csv')) }

  	it "should create new products for each row" do
  		Product.all.count.should eq 4
  	end

  	it "should create a sub_category for the product if one doesn't exist" do
  		Product.all.first.sub_category.should_not be_nil
  	end

  	it "should create the parent category for each category" do
  		Product.all.first.sub_category.main_category.should_not be_nil
  	end

  	it "should only create one instance of each category" do
  		category_name = Product.all.first.sub_category.name
  		SubCategory.where(name: category_name).count.should eq 1
  	end
  end
end
