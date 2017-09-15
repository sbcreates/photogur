class PicturesController < ApplicationController

  before_action :ensure_logged_in, except: [:show, :index]
  before_action :load_picture, only: [:show, :edit, :update, :destroy]
  # if you try to modify or remove a picture that you didn't create, you should be redirected to the login page.
  before_action :ensure_user_owns_picture, only: [:edit, :update, :destroy]

  def index
    # @pictures = Picture.all
    @most_recent_pictures = Picture.most_recent_five
    @old_pictures = Picture.created_before(DateTime.current - 1.month)
    # @pics_2017 = Picture.pictures_created_in_year(2017)
  end

  def show
    # @picture = Picture.find(params[:id])
    # load_picture takes care of the above
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
    # @picture = Picture.find(params[:id])
    # load_picture takes care of the above
  end

  def update
    # @picture = Picture.find(params[:id])
    # load_picture takes care of the above

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
    # @picture = Picture.find(params[:id])
    # load_picture takes care of the above
    @picture.destroy

    redirect_to '/pictures'
  end

  def load_picture
    @picture = Picture.find(params[:id])
  end

end
