class AddDescriptionToCategories < ActiveRecord::Migration
  def change
  	add_column :main_categories, :description, :text
  	add_column :sub_categories,  :description, :text
  end
end
