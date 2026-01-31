class About < ApplicationRecord
    has_one_attached :mission_image
    has_one_attached :vision_image
    has_one_attached :offer_image
    has_one_attached :why_choose_image

    validates :hero_title, :hero_subtitle, :mission_title, :mission_description, :vision_title, :vision_description, :values_offer, :values_why,  presence: true
    validates :hero_subtitle, :mission_description, :vision_description, :values_offer, :values_why, length: { maximum: 350 }
end
