require 'spec_helper'

FactoryGirl.define do

  factory :main_category do
    sequence(:name) { |n| "MainCategory#{n}" }
    description "Main category description"
  end

  factory :sub_category do
  	sequence(:name)   { |n| "SubCategory#{n}" }
  	sequence(:number) { |num| num }
    description "Sub category description"
  	main_category
  end

  factory :product do
  	sequence(:description) { |n| "Product#{n}" }
  	sub_category
  end

  factory :admin do
    sequence(:email) { |n| "admin#{n}@host.com" }
    password "password"
    password_confirmation "password"
  end
end