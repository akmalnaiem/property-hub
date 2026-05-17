class Avo::Resources::Blog < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: q, m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :blog_category_id, as: :number
    field :city, as: :text
    field :content, as: :textarea
    field :published_at, as: :date_time
    field :state, as: :text
    field :status, as: :select, enum: ::Blog.statuses
    field :title, as: :text
    field :user_id, as: :number
    field :image, as: :file
    field :user, as: :belongs_to
    field :blog_category, as: :belongs_to
  end
end
