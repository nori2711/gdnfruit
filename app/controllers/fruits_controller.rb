class FruitsController < ApplicationController
  def index
    @fruits = Fruit.all
    @harvests = Harvest.all.order("id DESC")
  end

  def new
    @fruit = Fruit.new
  end

  def create
    @fruit = Fruit.new(fruit_params)
    if @fruit.save
      flash[:notice] = "果実の登録が完了しました。"
      redirect_to "/users/show"
    else
      render "new"
    end
  end

  def show
    @fruit = Fruit.find(params[:id])
    @address = Postal.new(@fruit.fruit_address1).search
  end

  private
  def fruit_params
    params.require(:fruit).permit(:fruit_name, :fruit_address1, :fruit_address2, :fruit_address3, :fruit_detail, :harvest_season, :harvest_people, :photo).merge(user_id: current_user.id)
  end
end
