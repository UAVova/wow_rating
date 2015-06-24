class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :votes do
    def today
      where(:created_at => (Time.now - 24.hours)..Time.zone.now)
    end
  end
  has_many :servers
  has_many :reviews
  validates_acceptance_of :rules, :allow_nil => false, :on => :create
  validates :username, uniqueness: true, presence: true, 
                       format: { with: /\A[a-zA-Z0-9]+\Z/ }, 
                       length: { in: 6..16 }
  validates :email, length: { in: 6..30 }, on: :create
  validates_date :birthday, presence: true, :before => lambda { 14.years.ago }, 
                                            :after  => lambda { 60.years.ago }
  has_attached_file :avatar, :styles => { :mini => "24x24>", :thumb => "128x128>" }, :default_url => ":style/missing.png",
                    :url  => '/assets/avatars/:id/:style/:basename.:extension',
                    :path => ':rails_root/public/assets/avatars/:id/:style/:basename.:extension'
  validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 1.megabytes
  validates_with AttachmentContentTypeValidator, :attributes => :avatar, :content_type => ["image/jpeg", "image/png"]
  attr_accessor :delete_avatar
  before_save :avatar_check

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
  
  # Custom getter & setter to override standard devices password column name
  def encrypted_password
    read_attribute(:password)
  end

  def encrypted_password=value
    write_attribute(:password, value)
  end

  private

  def avatar_check
    self.avatar = nil if delete_avatar
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.username = "#{auth.info.first_name}#{auth.info.last_name}"
      user.name = auth.info.first_name
      user.surname = auth.info.last_name
      user.uid = auth.uid
      user.provider = auth.provider
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

end
