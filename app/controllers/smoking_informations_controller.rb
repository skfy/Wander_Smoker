class SmokingInformationsController < ApplicationController
  def index
    @user = current_user
    #@smoking_information = SmokingInformation.find(params[:id])
  end
  def show
    
  end
  def update

  end
  def destroy

  end
end
