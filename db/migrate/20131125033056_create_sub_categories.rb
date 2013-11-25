class CreateSubCategories < ActiveRecord::Migration
  def change
    create_table :sub_categories do |t|
      t.string :name
      t.integer :number
      t.references :main_category

      t.timestamps
    end
  end
end
