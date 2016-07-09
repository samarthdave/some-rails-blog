class User < ActiveRecord::Base
	validates :username, presence: true, length: {minimum: 3, maximum: 30}
	validates :email, presence: true, length: {minimum: 7, maximum: 50}
end