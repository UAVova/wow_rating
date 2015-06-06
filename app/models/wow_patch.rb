class WowPatch < ActiveRecord::Base
    has_many :realms, foreign_key: "version", :inverse_of => :wow_patch
end
