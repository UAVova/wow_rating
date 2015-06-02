class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_acceptance_of :rules, :allow_nil => false, :on => :create
  validates :username, uniqueness: true, presence: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }, length: { in: 6..16 }
  validates :email, presence: true, length: { in: 6..30 }, on: :create
  validates_date :birthday, presence: true, :before => lambda { 14.years.ago }, :after => lambda { 60.years.ago }

  def password_required?
    super && provider.blank?
  end

  private

  # Custom getter & setter to override standard devices password column name
  def encrypted_password
    read_attribute(:password)
  end

  def encrypted_password=value
    write_attribute(:password, value)
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
        # In case if user wants to register using site registration next time
        session.delete("devise.user_attributes")
    else
      super
    end
  end
end
