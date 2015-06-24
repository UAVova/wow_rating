class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :server
	validates  :user,    presence: true 
	validates  :server,  presence: true
	validates  :comment, :negative, :positive, presence: true, length: { minimum: 50, maximum: 255 },
	                                      	   format: { :with => Settings.regexps.review_content_regexp }
    validate  :reviews_quota

  


	def reviews_quota
	  if user.reviews.where(server_id: server).count >= 1
	    errors.add(:base, "You can post one review per server.")
	  end
	end

end
