class PropertyCategory < ApplicationRecord
  has_many :property_types, dependent: :destroy
  has_many :properties, dependent: :nullify
end
