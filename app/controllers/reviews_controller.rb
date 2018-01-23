class ReviewsController < ApplicationController
  def new
    @harvest = Harvest.find(params[:harvest_id])
    @review = Review.new
  end

  def create
    Review.create(create_params)
    flash[:notice] = "レビューの投稿が完了しました。"
    redirect_to "/users/show"
  end

  private
  def create_params
    params.require(:review).permit(:rate, :review).merge(harvest_id: params[:harvest_id], user_id: current_user.id)
  end
end
