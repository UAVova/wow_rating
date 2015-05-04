class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_acceptance_of :rules, :allow_nil => false, :on => :create
  validates :username, uniqueness: true, presence: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }, length: { in: 6..16 }
  validates :email, presence: true, length: { in: 6..30 }, on: :create
  validates :password, confirmation: true, length: { in: 6..25 }, on: :create
  validates_date :birthday, presence: true, :before => lambda { 18.years.ago }, :after => lambda { 60.years.ago }

  private

  # Custom getter & setter to override standard devices password column name
  def encrypted_password
    read_attribute(:password)
  end

  def encrypted_password=value
    write_attribute(:password, value)
  end  

end
