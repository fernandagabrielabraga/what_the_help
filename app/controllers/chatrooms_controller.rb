class ChatroomsController < ApplicationController
  def show
    @donation = Donation.find(params[:donation_id])
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end
end
