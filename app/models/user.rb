class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    last_name.upcase + ", " + first_name.upcase
  end
end
