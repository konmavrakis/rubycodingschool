class User < ApplicationRecord
  # Associations
  # ===========
  has_many :lists
 

  # Devise Config
  # =============

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # #3 password must be at least 8 chars and not bigger than 16.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, password_length: 8..16


  # Validations
  # ===========

  # name and email should be unique
  validates :email, uniqueness: true


  # name and email should be unique
  validates :name, uniqueness: true, presence: true
  
  # name should be bigger than 4 chars
  validates :name, length: { 
    within: 4..50,
    wrong_length: 'Invalid length', 
    too_long: "%{count} characters is the maximum allowed", 
    too_short: "must have at least %{count} characters"  
  }
 
end
