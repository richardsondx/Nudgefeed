module Api
	module V1
		class SessionsController < ApplicationController
			def create
				user = User.from_omniauth(env["omniauth.auth"])
		
		    	session[:user_id] = user.id
		    	redirect_to root_url
			end

			def destroy
			end
		end
	end
end
