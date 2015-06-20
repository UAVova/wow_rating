class Vote < ActiveRecord::Base
  belongs_to :server
  belongs_to :user
  validates  :user, :server, presence: true
  validates  :rating, presence: true, inclusion: 1..5
end
