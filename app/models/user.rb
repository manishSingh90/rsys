class User < ApplicationRecord
  # refer: https://www.javatpoint.com/ruby-on-rails-session
  # has_secure_password
  has_one :address, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :dob, presence: true
  validates :gender, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true
  validates :password, presence: true


  def full_name
    "#{first_name} #{last_name}"
  end

end
