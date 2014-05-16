class User < ActiveRecord::Base
	has_many :posts
	has_many :topics
	has_many :nudges
end
