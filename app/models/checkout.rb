class Checkout < ApplicationRecord
	belongs_to :user
	has_one :payment

	validates :first_name, presence: true, length: { maximum:10 }
	validates :last_name, presence: true, length: { maximum:10 }
	validates :address, presence: true, length: { maximum:255 }
	validates :secound_address, length: { maximum:255 }
	validates :postal_code, presence: true, length: { maximum:6 }
	validates :country, presence: true
	validates :phone_number, presence: true, length: { maximum: 11, minimum: 10 }
end
