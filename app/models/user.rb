class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = %w[standard admin].freeze
  enum role: ROLES

  validates :first_name, :last_name, :role, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
