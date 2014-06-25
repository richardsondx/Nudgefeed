module Api
	module V1
		class TopicsController < ApplicationController
			respond_to :json
			before_filter :get_user
		
			resource_description do
				name "User Topic"
			end
		
			api :GET, '/users/:user_id/topics', "User Topics"
			api_version "1.0"
			param :topics, Hash do 
				param :user_id, :number, :required => true
			end
			def index
				topics = Topic.where(:user_id => user)
		
				respond_with topics
			end
		
			api :GET, '/users/:user_id/topics/:id', "Show User Topic"
			api_version "1.0"
			param :topic, Hash do 
				param :id, :number, :required => true
				param :user_id, :number, :required => true
			end
			def show
				topic = Topic.find(:id)
				respond_with topic
			end
		
			api :POST, '/topics/:id/unfollow', "Unfollow Topic"
			api_version "1.0"
			param :topic, Hash do 
			  param :id, :number, :required => true
			end
			def unfollow
				Topic.find(params[:id]).users.delete(user)
		
				topics = Topic.where(:user_id => user)
		
				respond_with topics
			end
		
			protected
		
			def get_user
				user = User.find(params[:id])
			end
		end
	end
end
		