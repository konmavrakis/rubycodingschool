class List < ApplicationRecord
  belongs_to :users
  has_many :product_lists
  has_many :products, through :product_lists
end
