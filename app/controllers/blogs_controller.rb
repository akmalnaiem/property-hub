class BlogsController < ApplicationController

  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :authorize_admin!, except: [ :index, :show ]

  def index

    @categories = BlogCategory.all
    if params[:category_id].present?
      @blogs = Blog.where(blog_category_id: params[:category_id]).order(created_at: :desc)
    else
      @blogs = Blog.all.order(created_at: :desc)
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      redirect_to @blog, notice: "Blog added successfully"
    else
      render :new
    end
  end

  # def edit
  # end

  # def update
  # end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :published_at, :status, :city, :state, :image, :blog_category_id)
  end

  def authorize_admin!
    redirect_to blogs_path, alert: "Access Denied" unless current_user.admin?
  end

end
