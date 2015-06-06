class Server < ActiveRecord::Base
    VALID_CHARS_REGEXP = /\A[a-zA-Z\d\s]*\z/
	has_attached_file :image, :styles => { :medium => "160x130>" }, :default_url => "missing_server.png",
                      :url  => '/assets/servers/:id/:style/:basename.:extension',
                      :path => ':rails_root/public/assets/servers/:id/:style/:basename.:extension'
    validates_with AttachmentSizeValidator,        :attributes => :image, :less_than => 1.megabytes
    validates_with AttachmentContentTypeValidator, :attributes => :image,  :content_type => ["image/jpeg", "image/png"]
    has_many :realms, foreign_key: "server_id", :inverse_of => :server
    accepts_nested_attributes_for :realms, :allow_destroy => true
    validates :title, presence: true, format: { :with => VALID_CHARS_REGEXP }, length: { in: 3..20 }
    validates :url,   presence: true, format: { :with => URI.regexp(['http', 'https']) }  
    validates :description, presence: true, format: { :with => VALID_CHARS_REGEXP }, length: { in: 50..255 }
    validates :owner, presence: true, numericality: { only_integer: true }
end