class List < ApplicationRecord
  belongs_to:users
  has_one:product_lists
end
