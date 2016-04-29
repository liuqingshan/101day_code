class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_secure_password

  self.table_name = "users2"

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
