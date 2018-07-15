class AddFieldsToProductsAndCategories < ActiveRecord::Migration
  def change
  	remove_column :products, :description, :string

  	change_table :products do |t|
	    t.rename  :name, :description
	    t.string  :barcode_number
	    t.string  :units
	    t.string  :weight
	    t.integer :length
	    t.string  :brand
	  end

	  change_table :categories do |t|
	  	t.remove  :description
	  	t.integer :category_number
	  end
  end
end
