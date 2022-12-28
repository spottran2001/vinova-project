class User < ApplicationRecord
  has_one :cart
  has_many :orders, dependent: :destroy
  has_many :checkouts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private       

  def self.search(params)
    params[:query].blank? ? all : where(
      "email LIKE ?", "%#{sanitize_sql_like(params[:query])}%"
    )
  end

  def self.cron_email
    @users =User.all
    
    @users.each do |user|
      SendEmailJob.perform_later(user.email)
    end
  end
end
