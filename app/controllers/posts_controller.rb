class PostsController < ApplicationController
  def new
    # @post = Post.new
    @post = Post.new
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :description, :cost, :openspots, :approval, :category_id))
    @post.category_id = params['post']['category_id']
    @post.user = current_user
     if @post.save
       flash[:notice] = "Post was saved."
       redirect_to @post
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
     end
  end

  def update
    @post = Post.find(params[:id])
    @post.category_id = params['post']['category_id']
     if @post.update_attributes(params.require(:post).permit(:title, :description))
       flash[:notice] = "Post was updated."
       redirect_to @post
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
  end

  def edit
    @post = Post.find(params[:id])
    @post.category_id = params['post']['category_id']
  end

  def destroy
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
end
