module Api
	module V1
		class FeedsController < ApplicationController
			respond_to :json
		
			api :GET, '/feeds/popular', "Show Most Popular Posts ( Posts with the most Nudges accross the entire network )"
			api_version "1.0"
			def popular
				respond_with Post.popular
			end
		
			api :GET, '/feeds/friends', "Show User Friend's Posts ( Posts that people from the user network made )"
			api_version "1.0"
			def friends
			end
		end
	end
end
