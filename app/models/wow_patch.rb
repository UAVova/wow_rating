class WowPatch < ActiveRecord::Base
    has_many :realms, foreign_key: "version"
end
