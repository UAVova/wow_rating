class Realm < ActiveRecord::Base
    has_one :realm_type, foreign_key: "id"
    has_one :wow_patch,  foreign_key: "id"
    validates_date :creation_date, presence: true, :before => lambda { 14.years.ago }, 
                                                   :after  => lambda { 60.years.ago }
end
