module Api
	module V1
		class MainController < ApplicationController
			def login
				render template: "main/login"
			end
		
			api :GET, '/terms', "Show The Terms of Services"
			api_version "1.0"
			def terms
			end
		end
	end
end
