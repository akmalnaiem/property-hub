class User < ApplicationRecord
  has_many :properties, dependent: :destroy
  has_many :blogs, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, [ :admin, :user ]
  validates :name, :phone_number, presence: true
end
