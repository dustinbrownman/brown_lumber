require 'spec_helper'

FactoryGirl.define do

  factory :main_category do
    sequence(:name) { |n| "MainCategory#{n}" }
  end

  factory :sub_category do
  	sequence(:name)   { |n| "SubCategory#{n}" }
  	sequence(:number) { |num| num }
  	main_category
  end

end