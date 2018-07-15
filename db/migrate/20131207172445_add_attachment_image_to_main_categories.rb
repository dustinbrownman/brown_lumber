class AddAttachmentImageToMainCategories < ActiveRecord::Migration
  def change
    change_table :main_categories do |t|
      t.attachment :image
    end
  end
end
