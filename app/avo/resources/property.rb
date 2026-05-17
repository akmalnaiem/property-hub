class Avo::Resources::Property < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: q, m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :area_sqft, as: :number
    field :bathrooms, as: :number
    field :bedrooms, as: :number
    field :city, as: :text
    field :description, as: :textarea
    field :furnished, as: :boolean
    field :location, as: :text
    field :price, as: :number
    field :property_category, as: :belongs_to
    field :property_category_id, as: :number
    field :property_type, as: :belongs_to
    field :property_type_id, as: :number
    field :published, as: :boolean
    field :sale_status, as: :select, enum: ::Property.sale_statuses
    field :slug, as: :text
    field :state, as: :text
    field :status, as: :select, enum: ::Property.statuses
    field :title, as: :text
    field :user_id, as: :number
    field :images, as: :files
    field :user, as: :belongs_to
    field :property_features, as: :has_many
    field :features, as: :has_many, through: :property_features
  end
end
