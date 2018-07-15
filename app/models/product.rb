class Product < ActiveRecord::Base
	validates :description, presence: true	

	belongs_to :sub_category

	def self.import(csv)
		CSV.foreach(csv.path, headers: true) do |row|
			product_hash = row.to_hash.symbolize_keys
			sub_category_name = product_hash[:sub_category]
			main_category_name = product_hash[:main_category]

			product_hash[:sub_category] = SubCategory.find_or_create_by(name: sub_category_name) do |sub_category|
				sub_category.number = product_hash[:category_number]
				sub_category.main_category = MainCategory.find_or_create_by(name: main_category_name)
			end

			Product.create(product_hash.except(:main_category, :number, :picture))
		end
	end
end
