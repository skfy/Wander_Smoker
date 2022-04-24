class SmokingInformationsController < ApplicationController
  def new
    @smoking_information = SmokingInformation.new
  end
  def create
    @smoking_information = SmokingInformation.new(smoking_information_params)
    @smoking_information.user_id = current_user.id
    @smoking_information.save
    redirect_to smoking_informations_path
  end
  def index
    @smoking_information = SmokingInformation.new(smoking_information_params)
    @smoking_informations = SmokingInformation.find(params[:user_id])
    #page(params[:page]).reverse_order
    #@smoking_information = SmokingInformation.find(params[:id])
    #@user = current_user
    #@smoking_informations = @user.smoking_information
  end


  #def index
    #@user = current_user
    #@smoking_informations = @user.smoking_information
    #@smoking_information = SmokingInformation.find(params[:id])
  #end
  def show

  end
  def update
    @user = current_user
    @user.update(post_params)
    redirect_to smoking_informations_path
  end
  def destroy

  end

  private

  def smoking_information_params
    params.require(:smoking_information).permit(:user_id, :total_number, :total_amount, :no_smoking_days, :tax_payment_amount)
  end

end
