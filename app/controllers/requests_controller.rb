class RequestsController < ApplicationController
  def new
    @tree = Tree.find(params[:tree_id])
    @request = Request.new
  end

  def create
    @request = Request.new(user_id: current_user.id, tree_id: params[:tree_id])
    if @request.save
      flash[:notice] = "街の果樹の収穫イベントリクエストメールを送信しました。"
      redirect_to "/trees/#{@request.tree.id}"
    else
      render "new"
    end
  end
end
