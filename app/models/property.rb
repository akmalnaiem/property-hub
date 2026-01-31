class Property < ApplicationRecord
  paginates_per 9
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  belongs_to :user
  belongs_to :property_category
  belongs_to :property_type, optional: true
  has_many :property_features, dependent: :destroy
  has_many :features, through: :property_features
  has_many_attached :images

  validates :title, :description, :price, :area_sqft, :bathrooms, :state, :city, :location, presence: true
  enum :status, [ :sale, :rent ]
  enum :sale_status, [ :sold, :available], default: :available
end

