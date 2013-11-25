require 'spec_helper'

describe SubCategory do
	it { should validate_presence_of :name }
	it { should validate_uniqueness_of :name }
  it { should belong_to :main_category }
  it { should have_many :products }
end
