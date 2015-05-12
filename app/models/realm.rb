class Realm < ActiveRecord::Base
    has_one :realm_type, foreign_key: "id"
end
