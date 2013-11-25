class SubCategory < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
  belongs_to :main_category
  has_many :products
end
