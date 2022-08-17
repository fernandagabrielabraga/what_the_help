class DonationsController < ApplicationController
  before_action :donation_params, only: %i[create update]
  before_action :donation_id, only: %i[show edit update destroy]

  def index
    @donations = policy_scope(Donation).order(created_at: :desc)
  end

  def show
    authorize @donation
  end

  def new
    @donation = Donation.new
    authorize @donation
  end

  def create
    @donation = Donation.new(donation_params)
    # This link the user to the donation created
    @donation.user = current_user
    authorize @donation

    if @donation.save
      redirect_to donations_path
    else
      render :new
    end
  end

  def edit
    authorize @donation
  end

  def update
    @donation.update(donation_params)
    authorize @donation
    redirect_to donations_path
  end

  def destroy
    @donation.destroy
    authorize @donation
    redirect_to donations_path
  end

  private

  def donation_params
    params.require(:donation).permit(:donation_name, :description, :image, :category_id, :location, :quantity)
  end

  def donation_id
    @donation = Donation.find(params[:id])
  end
end
