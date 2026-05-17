class Avo::Resources::Home < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: q, m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :hero_badge_text, as: :text
    field :hero_subtitle, as: :textarea
    field :hero_title, as: :text
    field :why_choose, as: :textarea
    field :hero_image, as: :file
  end
end
