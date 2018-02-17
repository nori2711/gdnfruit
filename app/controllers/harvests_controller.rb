class HarvestsController < ApplicationController
  def index
    @search = Harvest.ransack(params[:q])
    @result = @search.result.order("id DESC")
  end

  def new
    @fruit = Fruit.find(params[:fruit_id])
    @harvest = Harvest.new
  end

  def create
    @harvest = Harvest.new(harvest_params)
    if @harvest.save
      flash[:notice] = "収穫イベントの登録が完了しました。"
      redirect_to "/users/show"
    else
      render "new"
    end
  end

  def show
    @harvest = Harvest.find(params[:id])
    @address = Postal.new(@harvest.fruit.fruit_address1).search
  end

  private
  def harvest_params
    params.require(:harvest).permit(:harvest_day, :people_number).merge(fruit_id: params[:fruit_id], user_id: current_user.id)
  end
end

# fruit_id: harvest_params[:fruit_id], harvest_day: harvest_params[:harvest_day], people_number: harvest_params[:people_number]
