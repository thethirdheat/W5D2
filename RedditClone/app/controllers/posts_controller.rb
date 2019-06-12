class PostsController < ApplicationController

  before_action :require_login

  def new
    @post = Post.new
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.sub_id = params[:sub_id]
    if @post.save
      redirect_to sub_post_url(params[:sub_id], @post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end
  
  def update
    @post = current_user.posts.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:errors] = @sub.errors.full_messages
      redirect_to sub_post_url(@post)
    end
  end

  def post_params
    params.require(:post).permit(:title, :content, :url)
  end
end
    # t.integer "author_id"
    # t.integer "sub_id"
    # t.string "title"
    # t.string "url"
    # t.string "content"
