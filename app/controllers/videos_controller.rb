class VideosController < ApplicationController
	def index
		@videos = Video.where(standard:params["standard"])
		#render plain: @videos.inspect
	end

	def new
		@video = Video.new
	end 

	def show
		  render plain: "show"
	end


	def create
		# @newVido = Video.new(params[:video])
		# #redirect_to admin_index_path
		@video = Video.new()
		@video.title=params[:video][:title]
		@video.link=params[:video][:link]
		@video.standard=params[:video][:standard]
		@video.description=params[:video][:description]
		@video.save
		redirect_to admin_index_path
	end


	def destroy
		  render plain: "delete"
	end


	def edit
		  render plain: "edit"
	end



	def update
		  render plain: "update"
	end




end
