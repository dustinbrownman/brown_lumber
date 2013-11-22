class AddFieldsToProducts < ActiveRecord::Migration
  def change
  	remove_column :products, :description, :text

  	change_table :products do |t|
	    t.string  :category
	    t.integer :cat_num
	    t.string  :part_number
	    t.string  :description
	  end
  end
end
