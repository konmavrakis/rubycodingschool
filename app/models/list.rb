class List < ApplicationRecord
  belongs_to :user
  has_many :product_lists
  has_many :products, through: :product_lists
end
