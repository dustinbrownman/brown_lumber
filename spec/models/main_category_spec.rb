require 'spec_helper'

describe MainCategory do
	it { should validate_presence_of :name }
	it { should validate_uniqueness_of :name }
	it { should have_many :sub_categories }
	it { should have_many :products }
end
