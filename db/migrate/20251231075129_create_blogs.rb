class CreateBlogs < ActiveRecord::Migration[8.1]
  def change
    create_table :blogs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.integer :status
      t.datetime :published_at
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
