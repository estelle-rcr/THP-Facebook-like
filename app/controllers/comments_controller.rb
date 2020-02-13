class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:edit, :update, :destroy]

  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(content: params[:content], gossip_id: @gossip.id)
    @comment.user = current_user
    @comments = @gossip.comments
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

  private
  def authenticate_user
    @comment = Comment.find(params[:id])
    unless @comment.user == current_user
      flash[:danger] = "Sorry, it's not your comment. You can't edit or delete it."
      redirect_to root_path
    end
  end
  
end
