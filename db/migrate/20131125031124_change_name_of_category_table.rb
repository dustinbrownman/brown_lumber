class ChangeNameOfCategoryTable < ActiveRecord::Migration
  def change
  	rename_table :categories, :main_categories

  	remove_column :main_categories, :category_number, :integer
  end
end
