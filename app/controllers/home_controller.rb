class HomeController < ApplicationController
  
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :require_admin!, only: [ :edit, :update ]
  before_action :set_home, only: [ :show, :edit, :update ]

  def index
    @home = Home.first
    @properties = Property.all.limit(3)

    # City/Location
    @properties = @properties.where(city: params[:city]) if params[:city].present?
    if params[:location].present?
      @properties = @properties.where("location LIKE ? OR city LIKE ?", "%#{params[:location]}%", "%#{params[:location]}%")
    end

    # Category/Type/BHK
    @properties = @properties.where(property_category_id: params[:property_category_id]) if params[:property_category_id].present?
    @properties = @properties.where(property_type_id: params[:property_type_id]) if params[:property_type_id].present?
    if params[:bhk].present?
      bhks = Array(params[:bhk]).map(&:to_i)
      bhks.select! { |b| (1..5).include?(b) }
      @properties = @properties.where(bedrooms: bhks) if bhks.any?
    end

    # Price
    if params[:price_range].present?
      min_price, max_price = params[:price_range].split("-").map(&:to_f)
      @properties = @properties.where(price: min_price..max_price)
    end

    @properties = @properties.order(created_at: :desc)
  end

  def show
  end

  def edit
  end

  def update
    if @home.update(home_params)
      redirect_to home_index_path, notice: "Home page updated successfully"
    else
      render :edit
    end
  end
 
  private

  def set_home
    @home = Home.first
  end

  def home_params
    params.require(:home).permit(
        :hero_title,
        :hero_subtitle,
        :hero_badge_text,
        :hero_image
      )
  end
end