class BlogsController < ApplicationController
  before_filter :check_general_content, :only => [:show,:edit]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(params[:blog])
    if @blog.save
      redirect_to @blog, :notice => "Post created successfully !"
    else
      flash[:alert] = "OOPS! something went wrong"
      render "new"
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])

    if @blog.update_attributes(params[:blog])
      redirect_to @blog, :notice => 'Post was successfully updated.'
    else
      flash[:alert] = "OOPS! something went wrong"
      render "edit"
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to(blogs_path, :notice => "Post Deleted !!")
  end

  private
    def check_general_content
      begin
        Blog.general_stuff.find(params[:id])
        return true
      rescue
        redirect_to blogs_path, :notice => 'This is NOT a General Content !!!'
      end
    end

end
