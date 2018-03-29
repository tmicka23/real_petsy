class HomeController < ApplicationController
  def index
  	@post = Post.last
  	@pet = Pet.all
  	@pet.limit(5).reverse
  end
end
