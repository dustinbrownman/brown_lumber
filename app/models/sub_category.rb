class SubCategory < ActiveRecord::Base
	has_attached_file :image, :styles => { full: "1000x350#", thumb: "300x150#" },
														:default_url => "/assets/:style/missing.png"

	belongs_to :main_category
	has_many :products, dependent: :destroy

	validates :name, presence: true, uniqueness: true
	validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'],
																						message: 'Only jpg, png, and gif files are permitted.'
end
