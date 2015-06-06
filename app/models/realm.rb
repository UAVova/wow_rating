class Realm < ActiveRecord::Base
    VALID_CHARS_REGEXP = /\A[a-zA-Z\d\s]*\z/
    has_one :realm_type, foreign_key: "id"
    has_one :wow_patch,  foreign_key: "id"
    has_one :server,     foreign_key: "id"
    validates_date :creation_date, presence: true
    validates :server,        presence: true
    validates :name,          presence: true, format: { :with => VALID_CHARS_REGEXP }, length: { in: 3..20 }
    validates :description,   format: { :with => VALID_CHARS_REGEXP }, length: { in: 20..255 }
    validates :rates,         presence: true, numericality: { only_integer: true, grater_than: 0,  less_than: 10000 }
    validates :version,       presence: true, numericality: { only_integer: true }
    validates :realm_type_id, presence: true, numericality: { only_integer: true }
    validates :online,        presence: true, numericality: { only_integer: true, grater_than: -1, less_than: 100000 }
end
