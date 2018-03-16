class PetsController < ApplicationController
  before_action :set_pet, only: [:edit, :update, :destroy]


  # GET /pets
  # GET /pets.json
  def index
    @pets = current_user.pets.all
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
    @pet = Pet.find(params[:id])
  end

  # GET /pets/new
  def new
    if user_signed_in?
      @pet = current_user.pets.new
    else
      redirect_to new_user_registration_path, danger: 'vous devez être connecter pour ajouter un animal'
    end
  end

  # GET /pets/1/edit
  def edit
  end

  # POST /pets
  # POST /pets.json
  def create
    @pet = current_user.pets.new(pet_params)
    if @pet.save
      redirect_to pets_path, success: 'Votre animal a bien été créé'
    else
      render :new
    end
  end

  # PATCH/PUT /pets/1
  # PATCH/PUT /pets/1.json
  def update
    if @pet.update(pet_params)
      redirect_to pets_path, success: 'Votre animal a bien été modifié'
    else
      render :edit
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to pets_url, notice: 'Pet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
    @pet = current_user.pets.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:name, :gender, :birthday, :species_id, :image)
    end
end
