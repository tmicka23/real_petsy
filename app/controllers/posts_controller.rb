class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
    


  def index
    @posts = Post.all
  end


  def show
    @post = current_user.posts.find(params[:id])
  end

 
  def new
    @post = current_user.posts.new
  end

 
  def edit
  end


  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path, success: 'Votre article a bien été créé'
    else
      render :new
    end
  end


  def update
    if @post.update(post_params)
      redirect_to posts_path, success: 'Votre article a bien été modifié'
    else
      render :edit
    end
  end


  def destroy
    @post.destroy
    redirect_to posts_url, success: 'Votre article a bien été modifié'
  end

  private

    def set_post
    @post = current_user.posts.find(params[:id])
    end


    def post_params
      params.require(:post).permit(:name, :content, :user_id)
    end
end
