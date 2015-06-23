class Vote < ActiveRecord::Base
  belongs_to :server
  belongs_to :user
  validates  :user, :server, presence: true
  validates  :rating, presence: true, inclusion: 1..5
  validates  :username, length: { :in => 3..12 },
  						format: { :with => Settings.regexps.vote_username_regexp },
  						allow_nil: true
  validate :votes_quota, :on => :create

  private

  def votes_quota
  	if user.votes.today.count >= 1
  	  errors.add(:base, "You can vote once in 24 hour")
  	end
  end
end
