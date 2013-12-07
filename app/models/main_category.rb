class MainCategory < ActiveRecord::Base
	has_many :sub_categories
	has_many :products, through: :sub_categories

	has_attached_file :image, :styles => { full: ['1000x250#', :png], thumb: ['300x150#', :png] },
														:default_url => "/assets/:style/missing.png"

	validates :name, presence: true, uniqueness: true
	validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'],
																						message: 'Only jpg, png, and gif files are permitted.'
end
