class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :server
	validates  :user,    presence: true 
	validates  :server,  presence: true
	validates  :comment, :negative, :positive, presence: true, length: { minimum: 50, maximum: 255 },
	                                      	   format: { :with => Settings.regexps.review_content_regexp }
end
