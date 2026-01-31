class PropertyType < ApplicationRecord
  belongs_to :property_category
  has_many :properties, dependent: :nullify
end
