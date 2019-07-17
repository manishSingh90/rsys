class Menu < ApplicationRecord
  has_many :items
  validates :menu_name, presence: true,
            length: { minimum: 5 }
end
