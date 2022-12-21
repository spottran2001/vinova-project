class Payment < ApplicationRecord
	belongs_to :order
	belongs_to :checkout

	validates :name_on_card, presence: true, length: { maximum:50 }
	validates :card_number, presence: true, length: { maximum:15 }
	validates :expiry_date, presence: true, length: { maximum:5 }
	validates :security_code, presence: true, length: { maximum:6 }
end
