class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]

  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blog_url(@blog), notice: "ブログを投稿しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def confirm
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id 
    render :new if @blog.invalid?
  end

  def update
    if @blog.update(blog_params)
      redirect_to blog_url(@blog), notice: "ブログを更新しました" 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: "ブログを削除しました" 
  end

  private
  def set_blog
    @blog = Blog.find(params[:id])
  end
  
  def blog_params
    params.require(:blog).permit(:title, :content, :user_id)
  end
end
