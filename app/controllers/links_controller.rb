class LinksController < ApplicationController
  before_action :authorized?, only: [:index]
  def index
    @links = Link.all
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to links_path
    else
      flash.now[:error] = @link.errors.full_messages.join(', ')
      render :index
    end
  end

  private
    def link_params
      params.permit(:title, :url)
    end
end
