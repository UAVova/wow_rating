class Server < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "160x130>" }, :default_url => "missing_server.png",
                    :url  => '/assets/servers/:id/:style/:basename.:extension',
                    :path => ':rails_root/public/assets/servers/:id/:style/:basename.:extension'
  validates_with AttachmentSizeValidator,        :attributes => :image, :less_than => 1.megabytes
  validates_with AttachmentContentTypeValidator, :attributes => :image,  :content_type => ["image/jpeg", "image/png"]
  has_many :realms,  foreign_key: "server_id", :inverse_of => :server
  has_many :reviews
  accepts_nested_attributes_for :realms, :allow_destroy => true
  validates :title, presence: true, format: { :with => Settings.regexps.server_title_regexp }, 
                                    length: { in: 3..20 }
  validates :url,   presence: true, format: { :with => URI.regexp(['http', 'https']) }  
  validates :description, presence: true, format: { :with => Settings.regexps.server_description_regexp },
  									    length: { in: 50..255 }
  validates :owner, presence: true, numericality: { only_integer: true }
  validate  :realms_validation

  def realms_validation
    if realms.size > Settings.realms.max_count.to_i
        errors.add(:base, "Max realms count is #{Settings.realms.max_count} per server")
      end
  end

  # Wanna get server position? - Here's some magic for it
  def position()
    Server.where("rating > CAST(#{self.send("rating")} AS float) 
               or rating = CAST(#{self.send("rating")} AS float)").order("rating DESC").count
  end
end