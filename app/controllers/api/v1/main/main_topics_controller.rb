module Api
	module V1
		class Main::MainTopicsController < ApplicationController
			respond_to :json
		
			resource_description do
				name	 'Main Topics'
			end
		
			api :GET, '/topics', "Show All Topics"
			def index
				respond_with Topic.all
			end
		
			api :GET, '/topics/:id', "Show Topic"
			param :topic, Hash do 
				param :id, :number, :required => true
			end
			def show
				respond_with Topic.find(params[:id])
			end
		
			api :GET, '/topics/:id/follow', "Follow Topic"
			param :topic, Hash do 
				param :id, :number, :required => true
			end
			def follow
			end
		
			api :GET, '/topics/:id/unfollow', "Unfollow Topic"
			param :topic, Hash do 
				param :id, :number, :required => true
			end
			def unfollow
			end
		end
	end
end