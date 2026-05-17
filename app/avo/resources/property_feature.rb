class Avo::Resources::PropertyFeature < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: q, m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :feature_id, as: :number
    field :property_id, as: :number
    field :property, as: :belongs_to
    field :feature, as: :belongs_to
  end
end
