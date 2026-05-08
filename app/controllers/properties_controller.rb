class PropertiesController < ApplicationController
  require "csv"

  before_action :authenticate_user!, except: [ :index, :show, :download_csv, :download_image ]
  before_action :require_broker!, except: [ :index, :show, :download_csv, :download_image ]
  before_action :set_property, only: [ :show, :edit, :update, :destroy ]

  def index
    @properties = Property.all.order(created_at: :desc).page(params[:page])

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
  end

  def show
  end

  def new
    @property = Property.new
  end

  def create
    @property = current_user.properties.build(property_params)
    if @property.save
      redirect_to root_path, notice: "Property added successfully"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @property.update(property_params)
      redirect_to @property, notice: "Property updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @property.destroy
    redirect_to root_path, notice: "Property deleted successfully"
  end

  def download_image
    image = ActiveStorage::Attachment.find(params[:id])

    send_data image.download, filename: image.filename.to_s, type: image.content_type, disposition: "attachment"
  end

  def download_csv
    property = Property.find(params[:id])

    csv_data = CSV.generate(headers: true) do |csv|
      csv << ["Image", "Title", "Price", "State", "City", "Location", "Description", "Features"]

      image_links = property.images.map do |img|
        download_image_property_url(property, image_id: img.id)
      end.join(",")
      
      csv << [
        image_links,
        property.title,
        property.price,
        property.state,
        property.city,
        property.location,
        property.description,
        property.features.pluck(:name).join(",")
        ] 
    end

    send_data csv_data, filename: "property_#{property.title}.csv", type: "text/csv"
  end

  private

  def set_property
    @property = Property.friendly.find(params[:id])
  end



  def property_params
    params.require(:property).permit(:title, :description, :price, :area_sqft, :property_category_id, :property_type_id, :bedrooms, :bathrooms, :furnished, :published, :status, :sale_status, :image, :state, :city, :location, images: [], feature_ids: [])
  end
end
