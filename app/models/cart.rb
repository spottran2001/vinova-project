class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_details, dependent: :destroy
end
