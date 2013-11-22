class Product < ActiveRecord::Base
	validates :name, presence: true	

	belongs_to :category

	def self.import(csv)
		CSV.foreach(csv.path, headers: true) do |row|
			product_hash = row.to_hash.symbolize_keys
			category_name = product_hash[:category]
			subcategory_name = product_hash[:subcategory]

			#Wait, the category that a product belongs to is the sub_category!

			product_hash[:category] = Category.find_or_create_by(name: category_name) do |category|
				category.subcategory = Category.find_or_create_by(name: subcategory_name) { |sub| sub.number = product_hash[:cat_num] }
			end


		end
	end
end
