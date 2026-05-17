class Avo::Resources::Feature < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: q, m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :icon, as: :text
    field :name, as: :text
    field :property_features, as: :has_many
    field :properties, as: :has_many, through: :property_features
  end
end
