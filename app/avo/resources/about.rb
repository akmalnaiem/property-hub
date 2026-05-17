class Avo::Resources::About < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: q, m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :cities_covered, as: :number
    field :happy_customers, as: :number
    field :hero_subtitle, as: :textarea
    field :hero_title, as: :text
    field :mission_description, as: :textarea
    field :mission_title, as: :text
    field :properties_listed, as: :number
    field :values_offer, as: :textarea
    field :values_why, as: :textarea
    field :vision_description, as: :textarea
    field :vision_title, as: :text
    field :years_experience, as: :number
    field :mission_image, as: :file
    field :vision_image, as: :file
    field :offer_image, as: :file
    field :why_choose_image, as: :file
  end
end
