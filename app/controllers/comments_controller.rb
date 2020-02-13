class CommentsController < ApplicationController

  def create
    @comments = @gossip.comments
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(content: params[:content], gossip_id: @gossip.id)
    @comment.user = current_user
    if @comment.save
      redirect_to @gossip
    else 
      flash[:danger] = "An error occured."
      render 'gossips/show'
  end
end

  def edit
    @comment = Comment.find(params[:id])
    @gossip = Gossip.find(params[:gossip_id])
  end

  def update
    @gossip = Gossip.find(params[:gossip_id]) 
    @comment = Comment.find(params[:id])
    if @comment.update(content: params[:content])
      @comments = @gossip.comments
      render 'gossips/show'
    end
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      @comments = @gossip.comments
      render 'gossips/show'
    end
  end
  
end
