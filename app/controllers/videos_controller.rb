class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
    @top_users = Video.select("user_id, count(*) as total_video").group(1).order("total_video DESC").limit(5).includes(:user)
    @top_videos = Video.order("views DESC").limit(3)
  end
  
  # GET /videos/1
  # GET /videos/1.json
  def show
    unless @video.nil?
      view_size = @video.views.to_i
      @video.views = view_size + 1
      @video.save
    end
  end

  # GET /videos/new
  def new
    @video = current_user.videos.build
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = current_user.videos.build(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Video was successfully deleted.' }
      format.json { head :no_content }
    end
  end

<<<<<<< HEAD
  def search
=======
  def upvote
    @video.upvote_from current_user
    redirect_to @video
  end

  def downvote
>>>>>>> f21d44d50927ec6e1c680fbac67dde5968104a16
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id]) rescue nil
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:title, :description, :status, :user_id, :thumbnail, :video)
    end
end
