class SmokingInformationsController < ApplicationController
  def index
    @user = current_user
    #@smoking_information = SmokingInformation.find(params[:id])
  end
  def show
    
  end
  def update
    @user = current_user
    @user.update(post_params)
    redirect_to smoking_informations_path
  end
  def destroy

  end
end
