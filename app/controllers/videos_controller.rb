class VideosController < ApplicationController
	before_action :set_video, :except => [:index, :new, :create]

	def index
		@videos = Video.all
	end

	def new
		@video = Video.new
	end

	def edit
	end

	def show
		@videos = Video.get_other_videos(@video.id)
	end

	def create
		@video = Video.new(video_params)
		if @video.save
			  gflash success: "video was successfully created."
			redirect_to videos_path
		else
			gflash :now, error: @video.errors.full_messages.join("<br/>").html_safe
			render "new"
		end
	end

	def update
		if @video.update(video_params)
			redirect_to videos_path
		else
			render "edit"
		end
	end

	def destroy
		@video.destroy
		redirect_to videos_path
	end

	private 

	def set_video
		@video = Video.friendly.find(params[:id])
	end

	def video_params
	#	params.require(:video).permit!
		params.require(:video).permit(:title, :description, :media, :media_cache)
	end



end
