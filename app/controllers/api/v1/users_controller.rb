module Api
	module V1
		class UsersController < ApplicationController
			respond_to :json
		
			api :GET, '/users', "List Users"
			api_version "1.0"
			def index
				respond_with User.all
			end
		
			api :GET, '/users/:id', "Show User"
			api_version "1.0"
			param :user, Hash do 
				param :id, :number, :required => true
			end
			def show
				user = User.find(params[:id])
		
				respond_with user
			end
		
			api :PUT, '/users/:id', "Update User Info"
			api_version "1.0"
			param :user, Hash do
				param :id, :number, :required => true
			end
			def update
				user = User.find(params[:id])
		
				respond_with user.update_attributes(params)
			end
		
			api :GET, '/users/:id/feed', "Show User Feed"
			api_version "1.0"
			param :user, Hash do
				param :id, :number, :required => true
			end
			def feed
				user = User.find(params[:id])
		
				respond_with user.posts
			end
		
		end
	end
end
		