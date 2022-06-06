class CommentsController < ApplicationController
  def create
    @offer = Offer.find(params[:offer_id])
    authorize @offer
    @comment = Comment.new(comment_params)
    authorize @comment
    @comment.offer = @offer
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html { redirect_to offer_path(@offer) }
        format.json { render json: { message_html: render_to_string( partial: '/comments/comment.html.erb', locals: { comment: @comment })}}
      end
    else
      @order = Order.new
      render 'offers/show.html.erb'
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
