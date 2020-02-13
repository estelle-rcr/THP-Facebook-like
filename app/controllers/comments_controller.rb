class CommentsController < ApplicationController
  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.create(content:params[:comment_content], user_id: User.all.sample, gossip_id: @gossip.id)
    @comments = @gossip.comments
    if @comment.save
      redirect_to root_path
    else 
      render 'gossips/show'
  end
end

  def edit
    @comment = Comment.find(params[:id])
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
