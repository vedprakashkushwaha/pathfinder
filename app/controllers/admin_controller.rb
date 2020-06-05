class AdminController < ApplicationController
    def index
        if admin==false
			redirect_to new_user_session_path
		end	
    end

  
    def grantVideoAccess
        if admin==false
			redirect_to new_user_session_path
		end	
        
    end

    def updateGrantVideoAccess
        if admin==true
            user =  User.find_by(email:params['email'])
            user.paid_videos_validity = Date.today + 30
            user.save  
            redirect_to admin_grantVideoAccess_path
		else
			redirect_to new_user_session_path
		end	
    end
    private
		def admin
			if current_user.present?
				current_user.email == "niraj93500@gmail.com" ? true: current_user.email == "Pathfinderkailashpuri@gmail.com" ? true:false
			else
				false
			end
		end
end
