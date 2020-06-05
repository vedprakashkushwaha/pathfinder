class VideosController < ApplicationController
	def index
		if current_user.present?
			@videos = Video.where(standard:params["standard"])
		else
			redirect_to new_user_session_path
		end
	end

	def new
		if admin==true
			@video = Video.new
		else
			redirect_to new_user_session_path
		end	
	end 

	def show
		if admin==true
			@videos = Video.all
		else
			redirect_to new_user_session_path
		end
	end

	def showAll
		if admin==true
			@videos = Video.all
		else
			redirect_to new_user_session_path
		end		
	end


	def create
		if admin==true
			@newVideo = Video.create(video_params)
			redirect_to admin_index_path
		else
			redirect_to new_user_session_path
		end	
	end


	def destroy
		if admin==true
			@video = Video.find_by(id: params[:id])
			@video.destroy
			redirect_to videos_showAll_path
		else
			redirect_to new_user_session_path
		end	
	end


	def edit
		if admin==true
			@video = Video.find_by(id: params[:id])
		else
			redirect_to new_user_session_path
		end	
	end


	def update
		if admin==true
			@video = Video.find_by(id: params[:video][:id])
			@video.update(video_params)
			redirect_to videos_showAll_path
		else
			redirect_to new_user_session_path
		end
		
	end


	private
        def video_params
            params.require(:video).permit(:title, :description, :link, :standard,:paid)
		end

		def admin
			if current_user.present?
				current_user.email == "niraj93500@gmail.com" ? true: current_user.email == "Pathfinderkailashpuri@gmail.com" ? true:false
			else
				false
			end
		end

end
