class Blog < ApplicationRecord
  belongs_to :user
  belongs_to :blog_category
  has_one_attached :image

  validates :title, :content, :published_at, :city, :state, :blog_category_id, presence: true
  enum :status, [ :draft, :published ]
end
