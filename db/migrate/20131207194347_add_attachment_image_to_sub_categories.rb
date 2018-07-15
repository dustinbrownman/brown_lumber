class AddAttachmentImageToSubCategories < ActiveRecord::Migration
  def change
    change_table :sub_categories do |t|
      t.attachment :image
    end
  end
end
