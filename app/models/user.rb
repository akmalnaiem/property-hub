class User < ApplicationRecord
  has_many :properties, dependent: :destroy
  has_many :blogs, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { admin: 0, broker: 1, user: 2 }
  validates :name, :phone_number, presence: true
end
