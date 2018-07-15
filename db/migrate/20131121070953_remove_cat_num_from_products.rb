class RemoveCatNumFromProducts < ActiveRecord::Migration
  def change
  	remove_column :products, :cat_num, :integer
  end
end
