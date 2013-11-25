class MainCategory < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true

	has_many :sub_categories
	has_many :products, through: :sub_categories
end
