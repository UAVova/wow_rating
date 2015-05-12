class Server < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "160x130>" }, :default_url => "missing_server.png",
                      :url  => '/assets/servers/:id/:style/:basename.:extension',
                      :path => ':rails_root/public/assets/servers/:id/:style/:basename.:extension'

    validates_with AttachmentContentTypeValidator, :attributes => :image, :content_type => ["image/jpeg", "image/png"]
    has_many :realms
    accepts_nested_attributes_for :realms, :allow_destroy => true
end