class User < ApplicationRecord
  # refer: https://www.javatpoint.com/ruby-on-rails-session
  # has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true
  validates :password, presence: true


  def to_s
    "#{first_name} #{last_name}"
  end

end
