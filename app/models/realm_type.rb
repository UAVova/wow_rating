class RealmType < ActiveRecord::Base
	has_many :realms, foreign_key: "realm_type", :inverse_of => :realm_type
end
