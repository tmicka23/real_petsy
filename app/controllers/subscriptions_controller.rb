class SubscriptionsController < ApplicationController

  before_action do
    @pet = Pet.find(params[:pet_id])
  end

  def create
    @pet.followers << current_user
    redirect_to @pet, success: 'Vous êtes maintenant abonné à ' + @pet.name
  end

  def destroy
    @pet.followers.delete(current_user)
    redirect_to @pet, success: 'Vous êtes maintenant désabonné à ' + @pet.name
  end

end
