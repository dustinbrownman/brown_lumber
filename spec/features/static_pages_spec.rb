require 'spec_helper'

describe 'Static pages' do
	let(:base_title) { 'Brown Lumber |' }
	subject { page }

	describe 'home page' do
		before { visit root_path }

		it { should have_content 'Welcome' }
		it { should have_title "#{base_title} Home" }
	end

	describe 'about page' do
		before { visit '/about' }

		it { should have_content 'About' }
		it { should have_title "#{base_title} About Us" }
	end

	describe 'location page' do
		before { visit '/location' }

		it { should have_content '4000' }
		it { should have_title "#{base_title} Location" }
	end
end