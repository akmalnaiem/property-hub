class Home < ApplicationRecord
    has_one_attached :hero_image

    validates :hero_title, :hero_subtitle, :hero_badge_text, presence: true
end
