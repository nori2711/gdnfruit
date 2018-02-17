class TreesController < ApplicationController
  def index
    @search = Tree.ransack(params[:q])
    @result = @search.result.order("id DESC")
  end

  def show
    @tree = Tree.find(params[:id])
  end

end
