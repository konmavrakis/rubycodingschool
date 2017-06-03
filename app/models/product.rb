class Product < ApplicationRecord
  has_many :product_lists
  has_many :lists, through: :product_lists  
end
