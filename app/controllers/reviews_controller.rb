class ReviewsController < ApplicationController

  def new
    @review = Review.new
    authorize @review
  end

  def show
    @review = Review.find(params[:id])
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    authorize @review

    if @review.save
      redirect_to review_path(@review)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
