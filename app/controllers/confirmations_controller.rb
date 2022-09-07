class ConfirmationsController < ApplicationController
  before_action :confirmation_params, only: %i[create]
  before_action :donation_id, only: %i[new create]
  before_action :user_id, only: %i[new create]
  def index
    @confirmations =  policy_scope(Confirmation)
  end

  def show
   @confirmation = Confirmation.where(user_id:current_user)
   authorize @confirmation
  end

  def new
    @confirmation = Confirmation.new
    authorize @confirmation
  end

  def create
    @confirmation = Confirmation.new(confirmation_params)
    # This link the user to the donation created
    @confirmation.user = current_user
    authorize @confirmation
  end

  private

  def confirmation_params
    params.require(:confirmation).permit(:donation_id, :user_id)
  end

  def donation_id_
    @donation = Donation.find(params[:id])
  end
end
