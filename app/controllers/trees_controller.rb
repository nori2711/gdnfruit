class TreesController < ApplicationController
  def index
    @search = Tree.ransack(params[:q])
    @result = @search.result.order("id DESC")
  end
end
