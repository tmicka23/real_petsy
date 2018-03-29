class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  def me
    @posts = current_user.posts.all
  end

  def follow
    pet_ids = current_user.followed_pets.pluck(:id)
   if pet_ids.empty?
     @posts = []
   else
     @posts = Post.joins('INNER JOIN pets_posts ON pets_posts.post_id = posts.id').where("pets_posts.pet_id IN (#{pet_ids.join(',')})")
   end
  end

  def index
    @posts = Post.all
  end


  def show
    @post = Post.find(params[:id])
  end


  def new
    if user_signed_in?
      @post = current_user.posts.new
    else
      redirect_to new_user_registration_path, danger: 'vous devez être connecter pour créer un article'
    end
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
    redirect_to posts_url, success: 'Votre article a bien été supprimé'
  end

  private

    def set_post
    @post = current_user.posts.find(params[:id])
    end


    def post_params
     p = params.require(:post).permit(:photo, :name, :content, :locale, pet_ids: [])
     p[:pet_ids] = current_user.pets.where(id: p[:pet_ids]).pluck(:id)
     p
    end
end
