class Product < ApplicationRecord
  has_many :product_photos, dependent: :destroy
  has_many :cart_details, dependent: :destroy
  has_many :order_details, dependent: :destroy
  accepts_nested_attributes_for :product_photos, allow_destroy: true, reject_if: proc { |attributes| attributes['photo'].blank? }

  validates :name, presence: true
  validates :price, presence: true
  validates :company, presence: true
  validates :description, presence: true
  validates :citizen_policy, presence: true
  validates :return_policy, presence: true
  validates :categories, presence: true
  #validate: tittle max 100 charts

  private

  def self.search(params)
    params[:query].blank? ? all : where(
      "name LIKE ?", "%#{sanitize_sql_like(params[:query])}%"
    )
  end

  def self.categories_search(params)
    where("? = ANY (categories)",params)
  end

  def self.product_sort(params)
    order("#{params} DESC")
  end

  def self.filtered_search(params)
    order("#{params[:fillter]} #{params[:sort]}")
  end
end