class VideosController < ApplicationController
	def index
		@videos = Video.where(standard:params["standard"])
		#render plain: @videos.inspect
	end

	def new
		@video = Video.new
	end 

	def show
		@video = Video.all
	end

	def showAll
		@videos = Video.all
	end


	def create
		@newVideo = Video.create(video_params)
		redirect_to admin_index_path
	end


	def destroy
		@video = Video.find_by(id: params[:id])
		@video.destroy
		redirect_to videos_showAll_path
	end


	def edit
		@video = Video.find_by(id: params[:id])
	end


	def update
		@video = Video.find_by(id: params[:video][:id])
		@video.update(video_params)
		redirect_to videos_showAll_path
	end


	private
        def video_params
            params.require(:video).permit(:title, :description, :link, :standard)
		end

end
