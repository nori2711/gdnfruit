class RequestsController < ApplicationController
  def new
    @tree = Tree.find(params[:tree_id])
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      NotificationMailer.send_confirm_to_request(@request).deliver
      flash[:notice] = "街の果樹の収穫イベントリクエストメールを送信しました。"
      redirect_to "/trees"
    else
      render "new"
    end
  end

  private
  def request_params
    params.require(:request).permit(:comment).merge(tree_id: params[:tree_id], user_id: current_user.id)
  end
end
