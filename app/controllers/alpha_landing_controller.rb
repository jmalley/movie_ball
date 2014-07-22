class AlphaLandingController < ApplicationController
  layout "lander"

  def index
    if user_signed_in?
      redirect_to :controller=> "home", :action => "index"
    end
    @alpha_sign_up = AlphaSignUp.new

  end

  def create
    @alpha_sign_up = AlphaSignUp.new(alpha_sign_up_params)
    @completed = true

    if @alpha_sign_up.save
      redirect_to root_path, notice: "Ok we got you. We'll let you know!"
    else
      redirect_to root_path, notice: "That didn't work."
    end
  end

  private

  def alpha_sign_up_params
    params.require(:alpha_sign_up).permit(:email)
  end
end
