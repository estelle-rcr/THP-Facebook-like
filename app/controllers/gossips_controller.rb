class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all 
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new('title' => params[:title], 'content' => params[:content], 'author_id' => params[:author])
    if @gossip.save
    redirect_to root_path
    else
    render 'new'
    end
  end

  def show
    @gossip = Gossip.find(params[:id])
    @comment = Comment.new
    @comments = @gossip.comments
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip.update(title: params[:new_title], content: params[:new_content])
      if @gossip.update(title: params[:new_title], content: params[:new_content])
        redirect_to @gossip
        flash.alert = "The gossip has been modified"
      else
        render :edit
      end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    if @gossip.destroy
      redirect_to root_path
      flash.alert = "The gossip has been deleted"
    else 
      render 'show'
    end
  end

end
