class ProductList < ApplicationRecord
  belongs_to :product
  belongs_to :list

  def increase
    if self.quantity.nil?
      self.quantity = 2
    else
      if self.quantity < 10
        self.quantity = self.quantity.next
      end
    end
    self.save
  end

  def decrease
    if self. quantity.nil?
      self.quantity = 1
    end
    if self.quantity > 1
      self.quantity = self.quantity.pred
    end
    self.save
  end
end
