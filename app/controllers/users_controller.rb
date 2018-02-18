class UsersController < ApplicationController

  def show
    # user = User.find(params[:id])
    @nickname = current_user.nickname
    @fruits = current_user.fruits
    @harvests = Harvest.where(user_id: current_user.id).order("fruit_id ASC","harvest_day ASC")
    @users = @harvests.map {|harvest| harvest.users }.flatten.uniq
    @members = current_user.members.order("harvest_id ASC")
    @reviews = current_user.reviews
    # @user = User.find(current_user.id)
    @address = Postal.new(current_user.address1).search
    @request = current_user.requests.order("id DESC")
  end

  private
  def hav_params
    params.require(:harvest).permit(:harvest_day, :people_number).merge(fruit_id: params[:fruit_id])
  end

end
