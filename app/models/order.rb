class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy
  has_one :payment

  def self.search(params)
    params[:query].blank? ? all : where(
      "status LIKE ?", "%#{sanitize_sql_like(params[:query])}%"
    )
  end
end
