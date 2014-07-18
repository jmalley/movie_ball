class AlphaLandingController < ApplicationController
  layout "lander"

  def index
    @alpha_sign_up = AlphaSignUp.new(params[:email])
  end

  def create
    @alpha_sign_up = AlphaSignUp.new(params[:email])
    @completed = true

    if @alpha_sign_up.save
      redirect_to root_path, notice: "Ok we got you. We'll let you know!"
    else
      # redirect_to root_path, notice: "That didn't work."
    end
  end

  private

  def invite_params
    params.require(:alpha_sign_ups).permit(:email)
  end
end
