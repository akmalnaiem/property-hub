class AddBlogCategoryToBlogs < ActiveRecord::Migration[8.1]
  def change
    add_reference :blogs, :blog_category, null: false, foreign_key: true
  end
end
