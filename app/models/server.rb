class Server < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "160x130>" }, :default_url => "missing_server.png",
                      :url  => '/assets/servers/:id/:style/:basename.:extension',
                      :path => ':rails_root/public/assets/servers/:id/:style/:basename.:extension'
    has_many :realms
end