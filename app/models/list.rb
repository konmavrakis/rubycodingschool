class List < ApplicationRecord
  belongs_to :user
  has_many :product_lists, dependent: :destroy
  has_many :products, through: :product_lists
  has_many :favorite_lists

  #Rating
  ratyrate_rateable "name"
end
