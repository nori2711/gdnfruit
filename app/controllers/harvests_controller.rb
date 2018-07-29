class HarvestsController < ApplicationController
  def index
    # 収穫情報を地図上に表示
    @harvests = Harvest.where("fruit_id >= ?", 32) #位置情報有りのレコードを抽出
    @fruit_lat = @harvests.map{ |har|
      har.fruit.latitude
    } #マーカー用の緯度情報の配列作成
    @fruit_lng = @harvests.map{ |har|
      har.fruit.longitude
    } #マーカー用の経度情報の配列作成
    @fruit_name = @harvests.map{ |har|
      har.fruit.fruit_name
    } #マーカー用の果実名の配列作成
    @apikey = ENV["GOOGLEMAP_APIKEY"]

    @search = Harvest.ransack(params[:q])
    @result = @search.result.order("id DESC")

    # 現在地の周辺の果実の配列作成
    latitude = params[:latitude]
    longitude = params[:longitude]
    @places = Fruit.near([latitude, longitude], 10, units: :km)
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
