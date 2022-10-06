class BlogsController < ApplicationController
  include SessionsHelper
  skip_before_action :login_required, only:[:index, :show]
  before_action :ensure_user, only: %i[ edit update destroy ]
  

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    return render :new if params[:back]
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
  def ensure_user
    @blogs = current_user.blogs
    @blog = @blogs.find_by(id: params[:id])
  end

  def blog_params
    params.require(:blog).permit(:content, :user_id)
  end
end
