class Avo::Resources::User < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: q, m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :email, as: :text
    field :name, as: :text
    field :phone_number, as: :text
    field :role, as: :select, enum: ::User.roles
    field :properties, as: :has_many
    field :blogs, as: :has_many
  end
end
