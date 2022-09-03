class DonationsController < ApplicationController
  before_action :donation_params, only: %i[create update]
  before_action :donation_id, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @donations = policy_scope(Donation).search_by_donation_name_and_description(params[:query]).order(created_at: :desc)
      @markers = @donations.geocoded.map do |donation|
        {
          lat: donation.latitude,
          lng: donation.longitude,
          info_window: render_to_string(partial: "info_window", locals: { donation: donation })
        }
      end
    else
      @donations = policy_scope(Donation).order(created_at: :desc)
      @markers = @donations.geocoded.map do |donation|
        {
          lat: donation.latitude,
          lng: donation.longitude,
          info_window: render_to_string(partial: "info_window", locals: { donation: donation })
        }
      end
    end
  end

  def show
    @chatroom = Chatroom.where(donation: @donation).first
    @chatroom = Chatroom.create!(user: current_user, donation: @donation, name: @donation.donation_name) if @chatroom.nil?
    @message = Message.new
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
    params.require(:donation).permit(:donation_name, :description, :image, :category_id, :location, :quantity, :available, :donation_received)
  end

  def donation_id
    @donation = Donation.find(params[:id])
  end

end
