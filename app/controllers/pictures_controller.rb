class PicturesController < ApplicationController

  before_action :ensure_logged_in, except: [:show, :index]

  def index
    # @pictures = Picture.all
    @most_recent_pictures = Picture.most_recent_five
    @old_pictures = Picture.created_before(DateTime.current - 1.month)
    # @pics_2017 = Picture.pictures_created_in_year(2017)
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]
    @picture.user_id = current_user.id

    if @picture.save
      redirect_to '/pictures'
    else
      flash[:alert] = @picture.errors.full_messages
      render :new
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]

    if @picture.save
      redirect_to picture_path(@picture)
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    redirect_to '/pictures'

  end

end
