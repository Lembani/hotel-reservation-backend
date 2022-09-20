class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist

  has_many :hotels, class_name: 'Hotel', foreign_key: 'user_id', dependent: :destroy
  has_many :reservations, class_name: 'Reservation', foreign_key: 'user_id', dependent: :destroy

  # input validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, length: { maximum: 60 }
end
