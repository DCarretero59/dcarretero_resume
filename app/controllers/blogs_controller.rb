class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  layout "blog"

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.all
    @page_subtitle = "Blogs"
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @page_subtitle = @blog.title
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
    @page_subtitle = "New Blog"
  end

  # GET /blogs/1/edit
  def edit
    @page_subtitle = "Edit #{@blog.title}"
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to blog_show_path @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to blog_show_path(@blog), notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_status
    if @blog.draft?
      success = @blog.published!
    elsif @blog.published?
      success = @blog.draft!
    end
    

    redirect_to blogs_url, notice: success ? 'Blog status successfully updated.': 'Error updating blog status.'

    
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body)
    end
end
