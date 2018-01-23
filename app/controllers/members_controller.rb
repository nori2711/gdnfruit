class MembersController < ApplicationController
  def index
    @member = Member.where(harvest_id: params[:harvest_id])
  end

  def new
    @harvest = Harvest.find(params[:harvest_id])
    @member = Member.new
  end

  def create
    @member = Member.new(user_id: current_user.id, harvest_id: params[:harvest_id], join: "1")
    if @member.save
      flash[:notice] = "収獲イベントへの参加登録が完了しました。"
      redirect_to "/harvests/#{@member.harvest.id}"
    else
      render "new"
    end
  end

  # def show
  #   @members = Member.find(params[:harvest_id])
  # end

  # private
  # def member_params
  #   params.require(:harvest).permit(:harvest_day, :people_number).merge(fruit_id: params[:fruit_id])
  # end
end
