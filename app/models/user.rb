class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lists
  validates :email, uniqueness: true
  validates :name, uniqueness: { scope: :email,  message: 'there can be only one!' }

  devise :database_authenticatable, :validatable, password_length: 8..16
  
end
