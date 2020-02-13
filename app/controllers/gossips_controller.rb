class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :show]
  before_action :authenticate_author, only: [:edit, :update, :destroy]

  def index
    @gossips = Gossip.all
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new('title' => params[:title], 'content' => params[:content])
    @gossip.author = current_user
    if @gossip.save 
      flash[:success] = "Your gossip has been created!"
    redirect_to root_path
    else
    render 'new'
    end
  end

  def show
    @gossip = Gossip.find(params[:id])
    @comment = Comment.new
    @comments = @gossip.comments
    puts "$" * 60
    puts "Voici comments in show :"
    puts @comments
    puts "$" * 60
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip.update(title: params[:new_title], content: params[:new_content])
      if @gossip.update(title: params[:new_title], content: params[:new_content])
        flash[:success] = "The gossip has been modified"
        redirect_to @gossip
      else
        render :edit
      end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    if @gossip.destroy
      flash[:success] = "The gossip has been deleted"
      redirect_to root_path
    else 
      render 'show'
    end
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

  def authenticate_author
    @gossip = Gossip.find(params[:id])
    unless @gossip.author == current_user
      flash[:danger] = "Sorry, it's not your gossip. You can't edit or delete it."
      redirect_to @gossip
    end
  end
end
