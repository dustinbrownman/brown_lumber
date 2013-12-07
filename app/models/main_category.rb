class MainCategory < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true

	has_many :sub_categories
	has_many :products, through: :sub_categories

	has_attached_file :image, :styles => { :full => "1000x500>", :thumb => "300x150>" },
														:default_url => "/images/:style/missing.png"
end
