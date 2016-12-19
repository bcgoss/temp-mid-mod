class LinksController < ApplicationController
  before_action :authorized?, only: [:index]
  def index
    @links = Link.all
    @new_link = Link.new
  end

  def show
    @link = Link.find_by(id: params[:id])
    @link.read!
    redirect_to @link.url
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to links_path
    else
      flash.now[:error] = @link.errors.full_messages.join(', ')
      redirect_to links_path
    end
  end

  def edit
    @link = Link.find_by(id: params[:id])
  end

  def update
    @link = Link.find_by(id: params[:id])
    if @link.update_attributes(link_params)
      redirect_to links_path
    else
      flash[:error] = @link.errors.full_messages.join(', ')
      redirect_to edit_link_path(@link)
    end
  end

  private
    def link_params
      params.require(:link).permit(:title, :url)
    end
end
