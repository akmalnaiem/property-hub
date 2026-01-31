class CreateBlogCategories < ActiveRecord::Migration[8.1]
  def change
    create_table :blog_categories do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
  end
end
