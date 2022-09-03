class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def donation_params
    params.require(:donation).permit(:title, :body, :photo)
  end

  def home
    @donations = Donation.all
  end

  def log_out
  end
end
