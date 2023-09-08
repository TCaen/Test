class UsersController < ApplicationController

    before_action :authenticate_user!
    def add
        @user = current_user
    end

    def update
        @user = current_user

    # Récupérez la valeur numérique saisie par l'utilisateur à partir des paramètres du formulaire
    amount = params[:amount].to_i

    # Validez la valeur (vous pouvez ajouter d'autres validations selon vos besoins)
    if amount > 0
      # Ajoutez la valeur à la balance de l'utilisateur
      @user.balance += amount

      if @user.save
        flash[:success] = "Ajout de #{amount} à la balance réussi."
      else
        flash[:error] = "Erreur lors de la mise à jour de la balance."
      end
    else
      flash[:error] = "La valeur doit être supérieure à zéro."
    end

    # Redirigez l'utilisateur vers la page d'accueil ou une autre page appropriée
    redirect_to root_path
  
    end

end
