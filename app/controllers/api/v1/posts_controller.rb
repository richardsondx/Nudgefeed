module Api
  module V1
    class PostsController < ApplicationController
     respond_to :json
    
       api :GET, '/users/:user_id/topics/:topic_id/posts', "Show User Posts"
       api_version "1.0"
       param :posts, Hash do
        param :user_id, :number, :required => true
        param :topic_id, :number, :required => true
       end 
       def index
          respond_with Post.all
       end
    
       api :GET, '/users/:user_id/topics/:topic_id/posts/:id', "Show User Post"
       api_version "1.0"
       param :post, Hash do 
         param :user_id, :number, :required => true
         param :topic_id, :number, :required => true
         param :id, :number, :required => true
       end
       def show
          respond_with Post.find(params[:id])
       end
    
       api :GET, '/users/:user_id/topics/:topic_id/posts', "Initialize User Post"
       api_version "1.0"
       param :post, Hash do 
          param :user_id, :number, :required => true
          param :topic_id, :number, :required => true
       end
       def new
          respond with Post.new
       end
    
       api :GET, '/users/:user_id/topics/:topic_id/posts', "Create User Post"
       api_version "1.0"
       param :post, Hash do 
          param :user_id, :number, :required => true
          param :topic_id, :number, :required => true
       end
       def create
        post = Post.create(params)
    
        if post.save
          respond_with post
        end
       end
    
       api :PUT, '/users/:user_id/topics/:topic_id/posts/:id', "Update User Post"
       api_version "1.0"
       param :post, Hash do 
          param :user_id, :number, :required => true
          param :topic_id, :number, :required => true
          param :id, :number, :required => true
       end
       def update
        respond_with Post.update_attributes(params)
       end
    
       api :DELETE, '/users/:user_id/topics/:topic_id/posts/:id', "Destroy User Post"
       api_version "1.0"
       param :post, Hash do 
          param :user_id, :number, :required => true
          param :topic_id, :number, :required => true
          param :id, :number, :required => true
       end
       def destroy
        respond_with Post.find(params[:id]).destroy
       end
    
       api :GET, '/users/:user_id/topics/:topic_id/posts/:id/nudge', "Nudge User Post"
       api_version "1.0"
       param :post, Hash do 
          param :user_id, :number, :required => true
          param :topic_id, :number, :required => true
          param :id, :number, :required => true
       end
       def nudge
          nudge = Nudge.find_by_user_id_and_post_id(param[:post], current_user)
          if nudge.present?
            nudge.destroy
          else
            Nudge.create!(
              :post_id => params[:post],
              :user_id => current_user,
            )
          end
        end
    end
  end
end
