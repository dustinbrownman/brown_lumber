require 'csv'
namespace :import_products_csv do
  task :import => :environment do
    CSV.parse(File.read("tmp/import_data.csv"), headers: true).each do |row|
    	product_hash = row.to_hash.symbolize_keys
    	category_name = product_hash[:category]
    	category = Category.where(name: category_name).first
    	if category.nil?
				product_hash[:category] = Category.create!({name: category_name})
    	else
    		product_hash[:category] = category
    	end
    	Product.create!(product_hash)
  	end  
  end
end 

# validate uniqueness of category name
# use find_or_create_by
# move this to an import method on Product and unit test it