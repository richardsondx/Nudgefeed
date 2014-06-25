module Api
	module V1
		class CommentsController < ApplicationController
			respond_to :json
			before_filter :get_post
		
			api :GET, '/users/:user_id/topics/:topic_id/posts/:post_id/comments', "Show All comments from a post"
			api_version "1.0"
			param :comment, Hash do 
				param :user_id, :number, :required => true
				param :topic_id, :number, :required => true
				param :post_id, :number, :required => true
			end
			def index
				respond_with post
			end
		
			api :GET, '/users/:user_id/topics/:topic_id/posts/:post_id/comments/:id', "Show a single comment from a post"
			api_version "1.0"
			param :comment, Hash do 
				param :user_id, :number, :required => true
				param :topic_id, :number, :required => true
				param :post_id, :number, :required => true
				param :id, :number, :required => true
			end
			def show
				respond_with post.comment.find_by_id(:id)
			end
		
			api :GET, '/users/:user_id/topics/:topic_id/posts/:post_id/comments', "Create user comment on a post"
			api_version "1.0"
			param :comment, Hash do 
				param :user_id, :number, :required => true
				param :topic_id, :number, :required => true
				param :post_id, :number, :required => true
			end
			def create
				respond_with post.build_comment(
					:message => params[:message]
				)
			end
		
			api :GET, '/users/:user_id/topics/:topic_id/posts/:post_id/comments/:id', "Update user comment from a post"
			api_version "1.0"
			param :comment, Hash do 
				param :user_id, :number, :required => true
				param :topic_id, :number, :required => true
				param :post_id, :number, :required => true
			end
			def update
				respond_with post.comment.udpate(:id, params)
			end
		
			api :GET, '/users/:user_id/topics/:topic_id/posts/:post_id/comments/:id', "Destroy user comment from a post"
			api_version "1.0"
			param :comment, Hash do 
				param :user_id, :number, :required => true
				param :topic_id, :number, :required => true
				param :post_id, :number, :required => true
			end
			def destroy
				respond_with post.comment.find_by_id(:id).destroy
			end
		
			private
		
			def get_post
				user  = User.find(params[:user_id])
				topic = Topic.find(params[:topic_id])
				post  = Post.find_by_user_id_and_topic_id(user, topic)
			end
		end
	end
end
		