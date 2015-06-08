class Realm < ActiveRecord::Base
    belongs_to :realm_type
    belongs_to :wow_patch,    foreign_key: "version"
    has_one :server,          foreign_key: "id"
    validates_date :creation_date, presence: true
    validates :server,        presence: true
    validates :name,          presence: true, format: { :with => Settings.regexps.realm_name_regexp }, 
                                              length: { in: 3..20 }
    validates :description,   format: { :with => Settings.regexps.realm_description_regexp }, 
                              length: { in: 20..255 }
    validates :rates,         presence: true, numericality: { only_integer: true, grater_than: 0,  less_than: 10000 }
    validates :version,       presence: true, numericality: { only_integer: true }
    validates :realm_type_id, presence: true, numericality: { only_integer: true }
    validates :online,        presence: true, numericality: { only_integer: true, grater_than: -1, less_than: 100000 }
end
