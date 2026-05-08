class AboutsController < ApplicationController
  
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_about
  before_action :require_admin!, only: [ :edit, :update, :destroy ]

  def index
    @abouts = About.first
  end

  def show
  end

  def edit
  end

  def update
    if @about.update(about_params)
      redirect_to about_path, notice: "About page updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @about.destroy
    redirect_to root_path, notice: "About page deleted"
  end

  private

  def set_about
    @about = About.first
  end



  def about_params
  params.require(:about).permit(
    :hero_title, :hero_subtitle,
    :properties_listed, :happy_customers,
    :cities_covered, :years_experience,
    :mission_title, :mission_description,
    :vision_title, :vision_description,
    :values_offer, :values_why,
    :mission_image,
    :vision_image,
    :offer_image,
    :why_choose_image
  )
end
end
