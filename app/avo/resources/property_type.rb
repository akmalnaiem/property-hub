class Avo::Resources::PropertyType < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: q, m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :name, as: :text
    field :property_category_id, as: :number
    field :property_category, as: :belongs_to
    field :properties, as: :has_many
  end
end
